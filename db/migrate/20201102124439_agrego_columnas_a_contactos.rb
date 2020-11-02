class AgregoColumnasAContactos < ActiveRecord::Migration[6.0]
  def change
    add_column :contactos, :division, :string
    add_column :contactos, :tipo_trabajador, :string
  end
end
