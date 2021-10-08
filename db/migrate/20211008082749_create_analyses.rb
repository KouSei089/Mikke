class CreateAnalyses < ActiveRecord::Migration[6.0]
  def change
    create_table :analyses do |t|
      t.string :positive_word
      t.string :negative_word
      t.float :emotion_point

      t.timestamps
    end
  end
end
