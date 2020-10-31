class AgregoFechaSeguimientos < ActiveRecord::Migration[6.0]
  def change
    add_column :seguimientos, :fecha_seguimiento, :date
  end
end
