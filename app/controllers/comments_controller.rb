class CommentsController < ApplicationController
  before_action :find_from_params, only: [:create, :destory]

  def create
    @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post.comments.find(params[:id]).destroy
    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_from_params
    @post = Post.find(params[:post_id])
  end
end
