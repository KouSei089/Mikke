class AddWordCountToDiaries < ActiveRecord::Migration[6.0]
  def change
    add_column :diaries, :word_count, :integer
  end
end
