class UsersController < ApplicationController
  # REMOVE BEFORE DEPLOYING
  skip_before_action :verify_authenticity_token

  before_action :find_user, only: [:show, :update, :edit, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    user = User.create!(user_params)
    redirect_to user
  end

  def edit
  end

  def update
    us = UserSkill.find_by(user_id: @user.id)
    params[:user][:skills].each do |skill_id|
      us.destroy if (us.user_id = @user.id) && ( us.skill_id = skill_id)
    end
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    puts
    puts
    puts
    pp params
    puts
    puts
    puts
    return params.require(:user).permit(:first_name, :last_name, :email, :description, skills: [])
  end
end
