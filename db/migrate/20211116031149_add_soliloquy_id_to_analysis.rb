class AddSoliloquyIdToAnalysis < ActiveRecord::Migration[6.0]
  def change
    add_reference :analyses, :soliloquy, foreign_key: true
  end
end
