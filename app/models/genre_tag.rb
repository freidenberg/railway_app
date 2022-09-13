class GenreTag < ApplicationRecord
  has_many :genre_tag_relations, dependent: :destroy
  #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
  has_many :posts, through: :genre_tag_relations, dependent: :destroy
end
