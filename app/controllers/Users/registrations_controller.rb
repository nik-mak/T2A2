# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    super
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
    # redirect_to @user
    end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :description, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :description, :email, :password, :skill_ids])
  end

  def user_params
    return params.require(:user).permit(:first_name, :last_name, :email, :description, skill_ids: [])
  end
end
