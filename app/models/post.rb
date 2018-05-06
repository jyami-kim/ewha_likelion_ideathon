class Post < ActiveRecord::Base
    
    resourcify
    
    mount_uploader :img, ImageUploader
    
    belongs_to :user
    has_many :comments
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
end
