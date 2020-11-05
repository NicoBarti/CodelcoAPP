class RUTIndiceValidator < ActiveModel::Validator
  require 'chilean_rut'
  def validate(record)
    unless RUT::validate(record.rut_indice)
      record.errors[:rut_indice] << "invalido"
    end
  end
end

class ExisteRutCasoIndice < ActiveModel::Validator
  def validate(record)
    encuentraRut = Trabajador.find_by rut: record.rut_indice
    if encuentraRut.blank?
      record.errors[:rut_indice] << "No existe un trabajador con este RUT ingresado como caso indice"
    end
  end
end

class ConfirmaPCR < ActiveModel::Validator
  def validate(record)
    if record.pcr.blank? or record.fechaPCR.blank? or record.pcr == "-"
      record.errors[:pcr] << "Debe ingresar fecha y resultado de PCR para caso CONFIRMADO"
    end
  end
end

class Episode < ApplicationRecord
  belongs_to :trabajador
  has_many :contactos
  has_one :sintoma
  has_many :seguimientos
  #has_many :tests

  validates_associated :sintoma
  # validates_associated :contacto

  validates_with RUTIndiceValidator, if: :conRutIndice
  validates_with ExisteRutCasoIndice, if: :origenLaboral?
  validates_with ConfirmaPCR, if: :casoConfirmado?

  validates :rut_indice, presence: {message: 'Debe ingresar RUT del caso índice de origen LABORAL'}, if: :origenLaboral?

  def conRutIndice
  if rut_indice.blank?
    return false
  else
    return true
  end
  end

  def origenLaboral?
    if origen_contagio == "Laboral"
      return true
    else
      return false
    end
  end

  def casoConfirmado?
    if tipo_ingreso == "Caso confirmado"
      return true
    else
      return false
    end
  end

end
