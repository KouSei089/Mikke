class AddSentimentIdToDiaries < ActiveRecord::Migration[6.0]
  def change
    add_column :diaries, :sentiment_id, :integer, null: false
  end
end
