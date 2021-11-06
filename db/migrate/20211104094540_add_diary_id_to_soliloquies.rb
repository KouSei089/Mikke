class AddDiaryIdToSoliloquies < ActiveRecord::Migration[6.0]
  def change
    add_reference :soliloquies, :diary, index: true
  end
end
