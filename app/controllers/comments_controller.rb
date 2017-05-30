class CommentsController < ApplicationController
  before_action :user_signed_in?
  before_action :find_post, only: [:create]
  before_action :check_follow, only: [:create]

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post = Post.find params[:post_id]
    if @comment.save
      flash[:success] = t "comment.comment_created"
      @post = Post.find params[:post_id]
      redirect_to post_path(@post)
    else
      @comments = @post.comments.include(:user)
      render "posts/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def check_follow
    following_ids = current_user.active_relationships.pluck(:followed_id)
    unless following_ids.include? @post.user.id
      flash[:danger] = t "comment.follow_to_comment"
      redirect_to :back
    end
  end
end
