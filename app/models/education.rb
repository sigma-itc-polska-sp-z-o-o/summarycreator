class Education < ApplicationRecord
  belongs_to :user

  def name
    self.school
  end

  rails_admin do

    fields_of_type :datetime do
      strftime_format "%m-%Y"
    end

    field :school
    field :specialization
    field :start
    field :end
    visible false
    exclude_fields :user
  end
end
