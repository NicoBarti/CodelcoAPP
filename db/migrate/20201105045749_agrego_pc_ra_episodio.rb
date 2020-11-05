class AgregoPcRaEpisodio < ActiveRecord::Migration[6.0]
  def change
    add_column :episodes, :pcr, :string
    add_column :episodes, :fechaPCR, :date
  end
end
