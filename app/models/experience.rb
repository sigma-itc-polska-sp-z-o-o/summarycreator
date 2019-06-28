class Experience < ApplicationRecord
  belongs_to :user

  def name
    self.company
  end

  rails_admin do

    fields_of_type :datetime do
      strftime_format "%m-%Y"
    end

    field :company
    field :start
    field :end
    field :role
    field :description
    visible false
    exclude_fields :user
  end
end
