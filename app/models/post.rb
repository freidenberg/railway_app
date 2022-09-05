class Post < ApplicationRecord
    belongs_to :user
    mount_uploaders :image, ImageUploader 
    mount_uploader :line_tag, ImageUploader
    serialize :image,JSON
    has_many_attached :image
    has_many :comments, dependent: :destroy 
    has_many :likes, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    has_many :line_tag_relations, dependent: :destroy
    #ぽstsテーブルから中間テーブルを介してTagsテーブルへの関連付け
    has_many :lines_tag, through: :line_tag_relations, dependent: :destroy
    def liked?(user)
        likes.where(user_id: user.id).exists?
    end
end

def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
end
