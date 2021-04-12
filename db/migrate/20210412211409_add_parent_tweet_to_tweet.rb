class AddParentTweetToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :parent_tweet, :integer, null: true
  end
end
