class AddNombreToTrabajadors < ActiveRecord::Migration[6.0]
  def change
    add_column :trabajadors, :nombres, :string
    add_column :trabajadors, :apellido1, :string
    add_column :trabajadors, :apellido2, :string
  end
end
