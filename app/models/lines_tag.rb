class LinesTag < ApplicationRecord
     #Tagsテーブルから中間テーブルに対する関連付け
  has_many :line_tag_relations, dependent: :destroy
  #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
  has_many :posts, through: :line_tag_relations, dependent: :destroy
  
end
