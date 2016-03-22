class UsersController < ApplicationController
  def show
    @user = User.find_by(id_token: params[:id_token])
  end

  def index
    @users = User.all
  end
end