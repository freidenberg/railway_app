class Post < ApplicationRecord
    belongs_to :user
    mount_uploaders :image, ImageUploader #_uploaders←複数形
  
    serialize :image,JSON

    has_many :comments, dependent: :destroy 
    has_many :likes, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    has_many :line_tag_relations, dependent: :destroy
    has_many :lines_tag, through: :line_tag_relations, dependent: :destroy
    has_many :genre_tag_relations, dependent: :destroy
    has_many :genre_tags, through: :genre_tag_relations, dependent: :destroy
    def liked?(user)
     likes.where(user_id: user.id).exists?
    end
    def bookmarked_by?(user)
     bookmarks.where(user_id: user).exists?
    end
end

