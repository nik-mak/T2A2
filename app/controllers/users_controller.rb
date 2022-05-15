class UsersController < ApplicationController
  # REMOVE BEFORE DEPLOYING
  # skip_before_action :verify_authenticity_token

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
    if params[:user].key?(:skill_ids)
      UserSkill.all.each do |user_skill|
        params[:user][:skill_ids].each do |skill_id|
          if (user_skill.skill_id == skill_id) && (user_skill.user_id == @user.id)
            user_skill.destroy 
          end
        end
      end
    else
      UserSkill.where(user_id: @user.id).destroy_all
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
    return params.require(:user).permit(:first_name, :last_name, :email, :description, skill_ids: [])
  end
end
