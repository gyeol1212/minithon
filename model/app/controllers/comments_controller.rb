class CommentsController < ApplicationController
  def create
    @comment=Comment.new(comment_params)
    # 모델 만들때 '작성자'도 만들고 아래처럼 쓰면 현재 로그인한 사람의 아이디로 적힘
    # @comment.### = current_user.id
    @comment.post_id=params[:post_id]

    @comment.save
    redirect_to :back
  end

  def destroy
    @comment=Comment.find(params[:id])
    @comment.destroy
    
    redirect_to :back
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def index
  end
end
