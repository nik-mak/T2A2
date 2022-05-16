class SkillsController < ApplicationController
  # REMOVE BEFORE DEPLOYING
  # skip_before_action :verify_authenticity_token
  
  before_action :authenticate_user!
  before_action :find_skill, only: [:show, :update, :edit, :destroy]

  def index
    @skills = Skill.order(:name)
  end

  def show
  end

  def new
    @skill = Skill.new
  end

  def create
    skill = Skill.create!(skill_params)
  end

  def edit
  end

  def update
    
    @skill.update(skill_params)
    redirect_to @skill
  end

  def destroy
    @skill.destroy
    redirect_to skills_path
  end

  private

  def find_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    return params.require(:skill).permit(:name)
  end

end
