class DiarySentiment < ApplicationRecord
  belongs_to :diary
  belongs_to :sentiment
end
