class AgregoEmpresaaContacto < ActiveRecord::Migration[6.0]
  def change
    add_column :contactos, :empresa, :string
  end
end
