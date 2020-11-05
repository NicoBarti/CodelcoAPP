class RemoveClientFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :tests, :episode, null: false, foreign_key: true
  end
end
