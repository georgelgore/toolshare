class AddImgUrlToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :image_url, :string, default: "profile/placeholder.png"
  end
end
