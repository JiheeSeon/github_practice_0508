class HomeController < ApplicationController
  def index
    @posts=Post.all
  end

  def new
  end

  #params는 post 방식으로 사용자가 보낸 정보에 접근할 수 있도록 해주는 해시
  #@blabla는 임시변수: 컨트롤러에서 연산된 결과를 해당 view(액션)에서 보여주기 위해
  def create
    @post = Post.new #모델이름 대문자로, 테이블에 한행 추가
    @post.title=params[:post_title]
    @post.content=params[:post_content]
    @post.save #테이블에 써준 내용 저장
    
    redirect_to '/home/index'
  end
  
  def destroy
    post=Post.find(params[:post_id])
    post.destroy
    redirect_to '/home/index'
  end
  
  def edit
    @post=Post.find(params[:post_id])
  end
  
  def update
    post=Post.find(params[:post_id])
    post.title=params[:post_title]
    post.content=params[:post_content]
    post.save
    
    redirect_to '/home/index'
  end
  
end