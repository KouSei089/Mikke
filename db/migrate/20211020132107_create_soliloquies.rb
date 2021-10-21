class CreateSoliloquies < ActiveRecord::Migration[6.0]
  def change
    create_table :soliloquies do |t|
      t.text :soliloquy, null: false

      t.timestamps
    end
  end
end
