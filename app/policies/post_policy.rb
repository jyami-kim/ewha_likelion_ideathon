class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
    def initialize(user, post)
      @user = user
      @post = post
    end
    def update?
      user.admin?(@post)
    end
    #admin? 은 user 모델에 정의해둔 메소드
  end
end
