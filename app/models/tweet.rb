class Tweet < ApplicationRecord
  validates :content, presence: true
  paginates_per 50
end
