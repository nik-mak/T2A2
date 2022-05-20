class User < ApplicationRecord
  rolify
  # Devise
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Skills
  has_many :user_skills
  has_many :skills, through: :user_skills, dependent: :destroy

  # Projects
  has_many :user_projects
  has_many :developer_projects, source: :project, through: :user_projects, dependent: :destroy
  has_many :requester_projects, class_name: 'Project', foreign_key: 'user_id', dependent: :destroy

  # Images
  has_one_attached :profile_img

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    return "#{first_name} #{last_name}"
  end
end
