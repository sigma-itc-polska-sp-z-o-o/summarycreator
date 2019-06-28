class UsersSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill

  validates :grade, numericality: { greater_than: 0, less_than_or_equal_to: 5 }

  delegate :name, to: :skill

  rails_admin do
    visible false
    exclude_fields :user
  end
end
