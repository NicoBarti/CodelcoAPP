class RUTIndiceValidator < ActiveModel::Validator
  require 'chilean_rut'
  def validate(record)
    unless RUT::validate(record.rut_indice)
      record.errors[:rut] << "invalido"
    end
  end
end

class Episode < ApplicationRecord
  belongs_to :trabajador
  has_many :contactos
  has_one :sintoma
  has_many :seguimientos
  has_many :tests

  validates_associated :sintoma
  validates_with RUTIndiceValidator, if: :conRutIndice

  def conRutIndice
  if rut_indice.blank?
    return false
  else
    return true
  end
  end


end
