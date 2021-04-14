class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friends, dependent: :destroy


  # select * from tweets where user_id = (
  #  select friend_id from friends where user_id = current_user.id);
  
  def liked?(tweet)
    likes.exists?(tweet_id: tweet)
  end

  def total_following
    self.friends.count
  end

  def total_followed
    Friend.where('friend_id=?', self.id).count
  end

  def suggest_friends
    current_friends_id = self.friends.map{|f| f.friend_id}
    current_friends_id.push(self.id)
    @suggest = User.where.not(id: current_friends_id)
  end

  def friend_list
    users = self.friends.map{|f| f.friend_id}
    users.push(self.id)
    return users
  end
end
