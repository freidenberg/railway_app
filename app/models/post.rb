class Post < ApplicationRecord
    belongs_to :user
    mount_uploaders :image, ImageUploader #_uploaders←複数形
    serialize :image,JSON
    has_many_attached :image
    has_many :comments, dependent: :destroy 
    has_many :likes, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    def liked?(user)
        likes.where(user_id: user.id).exists?
    end
end

def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
end
