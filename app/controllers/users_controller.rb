class UsersController < ApplicationController
  # REMOVE BEFORE DEPLOYING
  skip_before_action :verify_authenticity_token

  before_action :find_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    render plain: 'users#new'
  end

  def create
    user = User.create(project_params)
    redirect_to user
  end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    @user.destroy
    redirect_to root
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    return params.permit(:first_name, :last_name, :email, :description)
  end
end
