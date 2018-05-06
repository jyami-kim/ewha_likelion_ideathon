class LikesController < ApplicationController
    def like_toggle
        like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
        
        if like.nil?
            Like.create(user_id: current_user.id, post_id: params[:post_id])
            #현재 좋아요가 아닌 경우에는 좋아요 반영!
        else
            like.destroy
            # 이미 좋아요인 경우에는 삭제!
        end
        
        redirect_to :back
        
    end
    
end
