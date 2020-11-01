class CambioRutaString < ActiveRecord::Migration[6.0]
  def change
    change_column :trabajadors, :rut, :string
  end
end
