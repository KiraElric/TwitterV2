class Tweet < ApplicationRecord
  validates :content, presence: true
  paginates_per 50
  belongs_to :user

  def name
    self.user.user_name
  end

  def mail
    self.user.email
  end

  def image
    self.user.user_image
  end
  
end
