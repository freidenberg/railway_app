class RemoveImagecacheToPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :image_cache, :string 
  end
end
