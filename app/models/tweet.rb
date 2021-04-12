class Tweet < ApplicationRecord
  validates :content, presence: true
  paginates_per 50
  belongs_to :user
  has_many :likes, dependent: :destroy

  def name
    self.user.user_name
  end

  def mail
    self.user.email
  end

  def image
    self.user.user_image
  end
  
  def total_likes
    likes_counter = 0
    if likes.empty?
      return likes_counter
    else
      likes_counter = likes.count
    end
    return fav_counter
  end
end
