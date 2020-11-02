class RUTValidator < ActiveModel::Validator
  require 'chilean_rut'
  def validate(record)
    unless RUT::validate(record.rut)
      record.errors[:rut] << "invalido"
    end
  end
end

class Contacto < ApplicationRecord
  belongs_to :episode

  validates_with RUTValidator, if: :origenLaboral?
  validates :rut, presence: true, if: :origenLaboral?

  validates :division, presence: true, if: :origenLaboral?
  validates :empresa, presence: true, if: :trabajadorExterno?


  def origenLaboral?
    if tipo_contacto == "Laboral"
      return true
    else
      return false
    end
  end

  def trabajadorExterno?
    tipo_trabajador == "Externo"
  end

end
