class AddImageCacheToPosts < ActiveRecord::Migration[6.1]
  def change
    :posts, :image_cache, :string
  end
end
