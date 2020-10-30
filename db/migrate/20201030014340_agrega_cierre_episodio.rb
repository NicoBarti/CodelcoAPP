class AgregaCierreEpisodio < ActiveRecord::Migration[6.0]
  def change
    add_column :episodes, :abierto, :boolean
  end
end
