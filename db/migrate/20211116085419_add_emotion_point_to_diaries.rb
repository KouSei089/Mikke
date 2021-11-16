class AddEmotionPointToDiaries < ActiveRecord::Migration[6.0]
  def change
    add_column :diaries, :emotion_point, :float
  end
end
