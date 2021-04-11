class AddNameAndImageToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_name, :string
    add_column :users, :user_image, :string, default: 'http://placehold.jp/64x64.png'
    add_index :users, :user_name, unique: true
  end
end
