class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts, force: :cascade do |t|
   
    t.text "text"
    t.string "image"
    t.integer "user_id"
    t.timestamps

   end
 
end
