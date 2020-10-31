class Episode < ApplicationRecord
  belongs_to :trabajador
  has_many :contactos
  has_one :sintoma
  has_many :seguimientos
end
