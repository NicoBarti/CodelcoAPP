class AgregoCambioSeguimientoEpisodio < ActiveRecord::Migration[6.0]
  def change
    add_column :episodes, :cambioSeguimiento, :string
  end
end
