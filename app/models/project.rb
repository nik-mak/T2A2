class Project < ApplicationRecord
  has_many :user_projects
  has_many :developers, class_name: 'UserProject'
  has_many :requesters, class_name: 'UserProject'
end
