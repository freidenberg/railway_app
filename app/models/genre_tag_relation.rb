class GenreTagRelation < ApplicationRecord
  belongs_to :post
  belongs_to :genres_tag
end
