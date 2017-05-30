class UsersController < ApplicationController
  before_action :user_signed_in?

  def index
    @users = User.paginate page: params[:page],
      per_page: Settings.users.per_page
  end

  def show
    @user = User.find params[:id]
  end
end
