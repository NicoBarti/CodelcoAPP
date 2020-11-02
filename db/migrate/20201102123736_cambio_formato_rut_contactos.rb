class CambioFormatoRutContactos < ActiveRecord::Migration[6.0]
  def change
    change_column :contactos, :rut, :string
  end
end
