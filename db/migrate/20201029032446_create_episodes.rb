class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.string :folio
      t.string :tipo_ingreso
      t.datetime :fecha_ingreso
      t.integer :contactos_laborales
      t.integer :contactos_no_laborales
      t.string :presentacion
      t.date :inicio_sintomas
      t.date :inicio_cuarentena
      t.date :fin_cuarentena
      t.date :fin_cuarentena_codelco
      t.string :origen_contagio
      t.datetime :cierre
      t.references :trabajador, null: false, foreign_key: true

      t.timestamps
    end
  end
end
