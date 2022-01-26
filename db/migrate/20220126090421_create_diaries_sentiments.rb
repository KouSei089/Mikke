class CreateDiariesSentiments < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries_sentiments do |t|
      t.references :diary, foreign_key: true, null: false
      t.references :sentiment, null: false

      t.timestamps
    end
  end
end
