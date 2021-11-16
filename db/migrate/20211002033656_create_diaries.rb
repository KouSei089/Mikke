class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.string :title
      t.text :text, null: false

      t.timestamps
    end
  end
end
