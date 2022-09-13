class CreateGenreTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :genre_tag_relations do |t|

      t.timestamps
    end
  end
end
