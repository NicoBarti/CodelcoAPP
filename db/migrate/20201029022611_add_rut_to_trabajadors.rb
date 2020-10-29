class AddRutToTrabajadors < ActiveRecord::Migration[6.0]
  def change
    add_column :trabajadors, :rut, :numeric
  end
end
