class Analysis < ApplicationRecord
  has_one :diary, dependent: :destroy
  has_one :soliloquy, dependent: :destroy
end
