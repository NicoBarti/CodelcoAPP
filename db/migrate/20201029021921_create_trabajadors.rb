class CreateTrabajadors < ActiveRecord::Migration[6.0]
  def change
    create_table :trabajadors do |t|
      t.string :sexo
      t.date :fecha_nac
      t.integer :edad
      t.string :region
      t.string :comuna
      t.string :prevision
      t.string :nacionalidad
      t.string :division
      t.string :tipo_trabajador
      t.string :empresa

      t.timestamps
    end
  end
end
