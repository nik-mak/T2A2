class Project < ApplicationRecord
  belongs_to :user
  has_many :user_projects
  has_many :users, through: :user_projects, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :description, presence: true

  def joined?(user, project)
    UserProject.find_by(user_id: user.id, project_id: project.id).present?
  end
end
