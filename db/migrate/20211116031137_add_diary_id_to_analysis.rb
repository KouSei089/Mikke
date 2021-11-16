class AddDiaryIdToAnalysis < ActiveRecord::Migration[6.0]
  def change
    add_reference :analyses, :diary, foreign_key: true
  end
end
