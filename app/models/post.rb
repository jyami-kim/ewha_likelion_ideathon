class Post < ActiveRecord::Base
    mount_uploader :img, ImageUploader
    
    has_many :comments
end
