class Comment < ActiveRecord::Base
    belongs_to :post
    
        resourcify
end
