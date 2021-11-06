class RemoveDiaryFromSoliloquies < ActiveRecord::Migration[6.0]
  def change
    remove_index :soliloquies, :diary_id
    remove_reference :soliloquies, :diary
  end
end
