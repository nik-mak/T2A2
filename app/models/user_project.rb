class UserProject < ApplicationRecord
  belongs_to :project
  belongs_to :developer, class_name: 'User'
  belongs_to :requester, class_name: 'User'
end
