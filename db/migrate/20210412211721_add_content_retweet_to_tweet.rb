class AddContentRetweetToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :content_retweet, :text
  end
end
