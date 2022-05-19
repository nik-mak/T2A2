class SkillsController < ApplicationController
  before_action :find_skill, only: [:show, :destroy]

  def index
    @skills = Skill.order(:name)
  end

  def show
  end

  def new
    @skill = Skill.new
  end

  def create
    if Skill.find_by(name: params[:name]).present?
      redirect_to current_user, alert: 'Skill has already been created'
    else
      skill = Skill.create!(skill_params)
      current_user.skills.push(skill)
      redirect_to current_user
    end
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
    return params
      .require(:skill)
      .permit(:name)
  end

end
