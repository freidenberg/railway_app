class Post < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    has_many :comments, dependent: :destroy 
    has_many :likes, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
end
def liked?(user)
    likes.where(user_id: user.id).exists?
end
def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
end
