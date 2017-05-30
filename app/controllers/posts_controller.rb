class PostsController < ApplicationController
  before_action :user_signed_in?
  before_action :find_post, only: :show

  def index
    @posts = Post.paginate page: params[:page]
  end

  def show
    @comment = @post.comments.build
    @comments = @post.comments.new_first.includes(:user)
  end

  def find_post
    @post = Post.find params[:id]
  end
end
