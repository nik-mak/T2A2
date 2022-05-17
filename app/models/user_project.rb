class UserProject < ApplicationRecord
  belongs_to :project
  belongs_to :user

  # Validations
  validates :user_id, uniqueness: { scope: :project_id }
end
