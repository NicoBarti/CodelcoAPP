class Test < ApplicationRecord
  #belongs_to :episode
  belongs_to :trabajador

  validates :resultado, presence: true
end
