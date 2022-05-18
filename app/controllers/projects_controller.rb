class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :update, :edit, :join, :leave, :destroy]
  
  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    begin
      project = Project.new(project_params)
      project.save!
      redirect_to project
    rescue
      flash.now[:alert] = project.errors.full_messages.join('<br>')
      render 'new'
    end
  end

  def edit
  end

  def join
    UserProject.create(user_id: current_user.id, project_id: @project.id)
    redirect_to @project
  end

  def leave
    UserProject.where(user_id: current_user.id, project_id: @project.id).destroy_all
    redirect_to @project
  end

  def update
    begin
      if params[:project].key?(:user_ids)
        UserProject.all.each do |user_project|
          params[:project][:user_ids].each do |user_id|
            if (user_project.user_id == user_id) && (user_project.project_id == @project.id)
              user_project.destroy
            end
          end
        end
      else
        UserProject.where(project_id: @project.id).destroy_all
      end
      @project.update!(project_params)
      redirect_to @project
    rescue
      flash.now[:alert] = @project.errors.full_messages.join('<br>')
      render 'edit'
    end
  end

  def destroy
    user = @project.user
    @project.destroy
    redirect_to user_path(user.id)
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    return params
      .require(:project)
      .permit(:name, :description, :user_id, :status, user_ids: [])
      .with_defaults(user_id: current_user.id)
  end
end
