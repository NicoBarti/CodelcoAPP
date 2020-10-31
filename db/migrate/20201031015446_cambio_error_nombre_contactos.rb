class CambioErrorNombreContactos < ActiveRecord::Migration[6.0]
  def change
    change_column :contactos, :nombre, :string
  end
end
