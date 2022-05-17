class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :update, :edit, :destroy]
  
  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.create!(project_params)
    redirect_to project
  end

  def edit
  end

  def update
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
    @project.update(project_params)
    redirect_to @project
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
