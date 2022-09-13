class CreateGenreTags < ActiveRecord::Migration[6.1]
  def change
    create_table :genre_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
