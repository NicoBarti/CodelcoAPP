class CambioReferenciadeTesteo < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :trabajador, foreign_key: true
  end
end
