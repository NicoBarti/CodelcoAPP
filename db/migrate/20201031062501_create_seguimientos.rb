class CreateSeguimientos < ActiveRecord::Migration[6.0]
  def change
    create_table :seguimientos do |t|
      t.string :tipo_aislamiento
      t.string :estado_seguimiento
      t.boolean :hospitalizacion
      t.boolean :ventilacion
      t.boolean :falleceresp
      t.string :estadoegreso
      t.text :evolucion
      t.references :episode, null: false, foreign_key: true

      t.timestamps
    end
  end
end
