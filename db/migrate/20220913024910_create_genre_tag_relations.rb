class CreateGenreTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :genre_tag_relations do |t|

      t.timestamps
      t.references :post, null: false, foreign_key: true
      t.references :genre_tag, null: false, foreign_key: true
    end
  end
end
