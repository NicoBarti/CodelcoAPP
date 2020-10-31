class Trabajador < ApplicationRecord
  has_many :episodes
  has_many :tests, through: :episodes
end
