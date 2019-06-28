class Skill < ApplicationRecord
  has_many :users_skills
  has_many :users, through: :users_skills

  rails_admin do
    exclude_fields :users_skills, :users
  end
end
