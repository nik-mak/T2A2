class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    begin
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
      @user.update!(user_params)
      redirect_to @user
    rescue
      flash.now[:alert] = @user.errors.full_messages.join('<br>')
      render 'edit'
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    return params
      .require(:user)
      .permit(:first_name, :last_name, :description, :profile_img, skill_ids: [])
  end
end
