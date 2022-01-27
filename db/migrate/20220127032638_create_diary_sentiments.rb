class CreateDiarySentiments < ActiveRecord::Migration[6.0]
  def change
    create_table :diary_sentiments do |t|
      t.references :diary
      t.references :sentiment, foreign_key: true

      t.timestamps
    end
  end
end
