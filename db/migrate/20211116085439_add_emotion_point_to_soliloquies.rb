class AddEmotionPointToSoliloquies < ActiveRecord::Migration[6.0]
  def change
    add_column :soliloquies, :emotion_point, :float, default: 0
  end
end
