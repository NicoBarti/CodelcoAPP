class CreateContactos < ActiveRecord::Migration[6.0]
  def change
    create_table :contactos do |t|
      t.string :tipo_contacto
      t.string :parentesco
      t.date :fecha_investigacion
      t.references :episode, null: false, foreign_key: true

      t.timestamps
    end
  end
end
