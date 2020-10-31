class CreateSintomas < ActiveRecord::Migration[6.0]
  def change
    create_table :sintomas do |t|
      t.date :inicio_sintomas
      t.boolean :fiebre
      t.boolean :cefalea
      t.boolean :disnea
      t.boolean :tos
      t.boolean :odinofagia
      t.boolean :taquipnea
      t.boolean :cianosis
      t.boolean :mialgia
      t.boolean :dolorabdominal
      t.boolean :diarrea
      t.boolean :anosmia
      t.boolean :agueusia
      t.boolean :diabetes
      t.boolean :hipertension
      t.string :otras
      t.references :episode, null: false, foreign_key: true

      t.timestamps
    end
  end
end
