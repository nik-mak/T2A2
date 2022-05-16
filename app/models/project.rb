class Project < ApplicationRecord
  belongs_to :user
  has_many :user_projects
  has_many :users, through: :user_projects, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :description, presence: true
end
