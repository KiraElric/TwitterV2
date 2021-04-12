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

  def name_parent
    Tweet.find(self.parent_tweet).user.user_name
  end

  def mail_parent
    Tweet.find(self.parent_tweet).user.email
  end

  def image_parent
    Tweet.find(self.parent_tweet).user.user_image
  end
  
  def total_likes
    likes_counter = 0
    if likes.empty?
      return likes_counter
    else
      likes_counter = self.likes.count
    end
    return likes_counter
  end

  def total_retweets
    Tweet.where("parent_tweet=?", self.id).count
  end

  def time_posted
    minutes = ((Time.now - self.created_at).to_i)/60
    if minutes> 60
      time = "#{minutes/60} hrs"
    else
      time = "#{minutes} min"
    end
    return time
  end
end
