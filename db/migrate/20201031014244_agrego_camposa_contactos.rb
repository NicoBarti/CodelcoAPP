class AgregoCamposaContactos < ActiveRecord::Migration[6.0]
  def change
    add_column :contactos, :rut, :numeric
    add_column :contactos, :nombre, :numeric

  end
end
