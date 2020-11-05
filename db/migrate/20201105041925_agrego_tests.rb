class AgregoTests < ActiveRecord::Migration[6.0]
  def change
    change_table :tests do |t|
      t.remove :res_antigeno, :fecha_pcr, :res_pcr, :fecha_pcr_pac, :res_pcr_pac
      t.date :fecha_resultado, :fecha_toma
      t.string :tipo_test, :resultado
    end
  end
end
