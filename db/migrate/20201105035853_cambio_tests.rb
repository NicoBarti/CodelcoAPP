class CambioTests < ActiveRecord::Migration[6.0]

  def change
  remove_column :tests, :fecha_antigeno, :date
  end

end
