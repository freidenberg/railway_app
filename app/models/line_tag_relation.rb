class LineTagRelation < ApplicationRecord
  belongs_to :post
  belongs_to :lines_tag
end
