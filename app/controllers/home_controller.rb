class HomeController < ApplicationController

  def index #메인페이지 루트페이지
  end
  
  def clickIdea #상품 개별창
    @post= Post.find(params[:post_id])
    authorize! :read, @post
  end
  
  def updateIdea #상품 개별창에서 내용 수정
  end
  
  
  def ideaList # 전체 상품 리스트
    @posts = Post.all
    authorize! :read, @posts    
    unless user_signed_in?
      redirect_to '/users/sign_in'

    end
    #로그인 한 유저만 글의 목록을 볼 수 있도록!
    
  end
  
  def uploadIdea #상품 업로드
  end
  
  def create  #상품 업로드: create 처리 수행
    
    @post = Post.new
    authorize! :write, @post
    @post.writer_name = current_user.nickname
    @post.user_id = current_user.id
    @post.title = params[:title]
    @post.content = params[:content]
    @post.img=params[:image_up]
    @post.save

    
    redirect_to '/home/ideaList'
  end
  
  def updateIdea
    @post= Post.find(params[:post_id])
  end
  
  def update  #상품 내용수정 : update처리 수행
    
    @post= Post.find(params[:post_id])
    authorize! :update, @post
    #authorize @posts, :update?
    # 찾은 post가 user의 권한인지 보는거
    @post.user_id = current_user.id
    @post.writer_name = current_user.nickname
    @post.title = params[:title]
    @post.content = params[:content]
    @post.img=params[:image_up]
    @post.save
    
    
    
    redirect_to "/home/clickIdea/#{params[:post_id]}"
  end
  
  def destroy
    
    post = Post.find(params[:post_id])
    authorize! :destroy, @post
    #authorize post, :update?
    # 권한이 있으면 밑에 destroy 액션이 실행될거야!
    post.destroy
    
    redirect_to '/home/ideaList'
  end

end
