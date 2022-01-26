class DiarySentiment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :diary
  belongs_to_active_hash :sentiment
end
