class AddImgUrlToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :image_url, :string, default: 'background/moretools.png'
  end
end
