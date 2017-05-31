class PostsController < ApplicationController
  before_action :find_post, only: :show

  def index
    @posts = Post.paginate page: params[:page]
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.new_first.includes(:user)
  end

  def find_post
    @post = Post.find params[:id]
  end
end
