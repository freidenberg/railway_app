class AddImageCacheToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :image_cache, :string
  end
end
