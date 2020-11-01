class RUTValidator < ActiveModel::Validator
  require 'chilean_rut'
  def validate(record)
    unless RUT::validate(record.rut)
      record.errors[:rut] << "invalido"
    end
  end
end

class Trabajador < ApplicationRecord
  has_many :episodes
  has_many :tests, through: :episodes

  validates :rut, :division, :tipo_trabajador, presence: true
  validates :rut, uniqueness: true
  validates_with RUTValidator

end
