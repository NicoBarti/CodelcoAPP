class Sintoma < ApplicationRecord
  belongs_to :episode

  validates :inicio_sintomas, presence: true, if: :reportaSintomas?

def reportaSintomas?
  fiebre or cefalea or disnea or tos or odinofagia or taquipnea or cianosis or mialgia or dolorabdominal or diarrea or anosmia or agueusia

end
end
