class User < ApplicationRecord
  has_many :user_skills
  has_many :skills, through: :user_skills

  has_many :developer_projects, class_name: 'UserProject', foreign_key: 'developer_id'
  has_many :requester_projects, class_name: 'UserProject', foreign_key: 'requester_id'
end
