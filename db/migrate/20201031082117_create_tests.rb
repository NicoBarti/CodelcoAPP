class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.date :fecha_antigeno
      t.string :res_antigeno
      t.date :fecha_pcr
      t.string :res_pcr
      t.date :fecha_pcr_pac
      t.string :res_pcr_pac
      t.references :episode, null: false, foreign_key: true

      t.timestamps
    end
  end
end
