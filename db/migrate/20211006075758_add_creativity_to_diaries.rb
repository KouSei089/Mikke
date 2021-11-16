class AddCreativityToDiaries < ActiveRecord::Migration[6.0]
  def change
    add_column :diaries, :creativity, :integer, default: 0
  end
end
