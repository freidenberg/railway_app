class CreateLineTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :line_tag_relations do |t|
      t.references :post, null: false, foreign_key: true
      t.references :lines_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
