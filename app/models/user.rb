class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  belongs_to :posts
  belongs_to :comments
  has_many :likes
  has_many :liked_posts, through: :likes, source: :users

  def is_like?(post)
   Like.find_by(user_id: self.id, post_id: post.id).present? 
  end
  #User 모델의 한 객체에 대해 특정 글에 대한 좋아요 유무를 확인하는 메소드


end
