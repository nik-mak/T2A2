class ProjectsController < ApplicationController
  # REMOVE BEFORE DEPLOYING
  skip_before_action :verify_authenticity_token

  before_action :find_project, only: [:show, :update, :destroy, :edit]
  
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
    up = UserProject.find_by(project_id: @project.id)
    params[:project][:user_ids].each do |user|
      up.destroy if (up.project_id = @project.id) && ( up.user_id = user)
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
    return params.require(:project).permit(:name, :description, :user_id, user_ids: [] )
  end
end
