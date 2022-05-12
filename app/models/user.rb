class User < ApplicationRecord
  has_many :user_skills
  has_many :skills, through: :user_skills

  has_many :user_projects
  has_many :developer_projects, source: :project, through: :user_projects
  has_many :requester_projects, class_name: 'Project', foreign_key: 'user_id'

  def full_name
    return "#{first_name} #{last_name}"
  end
end
