class HomeController < ApplicationController
  def index #메인페이지 루트페이지
  end
  
  def clickIdea #상품 개별창
    @post= Post.find(params[:post_id])
  end
  
  def updateIdea #상품 개별창에서 내용 수정
  end
  
  
  def ideaList # 전체 상품 리스트
    @posts = Post.all
  end
  
  def uploadIdea #상품 업로드
  end
  
  def create  #상품 업로드: create 처리 수행
    @post = Post.new
    @post.title = params[:title]
    @post.content = params[:content]
    @post.img=params[:image_up]
    @post.other =params[:other]
    @post.save
    
    redirect_to '/home/ideaList'
  end
  
  def updateIdea
    @post= Post.find(params[:post_id])
  end
  
  def update  #상품 내용수정 : update처리 수행
    @post= Post.find(params[:post_id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.img=params[:image_up]
    @post.other =params[:other]
    @post.save
    
    redirect_to "/home/clickIdea/#{params[:post_id]}"
  end
  
  def destroy
    post = Post.find(params[:post_id])
    post.destroy
    
    redirect_to '/home/ideaList'
  end

end
