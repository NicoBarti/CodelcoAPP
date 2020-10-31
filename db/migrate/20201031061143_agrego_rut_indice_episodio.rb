class AgregoRutIndiceEpisodio < ActiveRecord::Migration[6.0]
  def change
    add_column :episodes, :rut_indice, :numeric
  end
end
