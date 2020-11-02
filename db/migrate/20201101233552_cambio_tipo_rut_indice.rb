class CambioTipoRutIndice < ActiveRecord::Migration[6.0]
  def change
    change_column :episodes, :rut_indice, :string

  end
end
