class GenreTagRelation < ApplicationRecord
  belongs_to :post
  belongs_to :genre_tag
end
