class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :users_skills
  has_many :skills, through: :users_skills
  has_many :experiences
  has_many :educations

  has_one_attached :summary
  attr_accessor :remove_summary
  after_save { summary.purge if remove_summary == '1' }

  accepts_nested_attributes_for :users_skills, :skills, :experiences, :educations

  rails_admin do
    edit do
      field :email do
        visible do
          if bindings[:view]._current_user.admin?
            true
          else
            false
          end
        end
      end
      field :password
      field :password_confirmation
      field :name
      field :surname
      field :role
      field :admin do
        visible do
          if bindings[:view]._current_user.admin?
            true
          else
            false
          end
        end
      end
      field :users_skills do
        label 'Skills'
      end
      field :experiences do
        label 'Experience'
      end

      field :educations do
        label 'Education'
      end
    end

    list do
      field :name
      field :surname
      field :role
      field :experience
    end

    show do
      field :name
      field :surname
      field :role
      field :users_skills do
        label 'Skills'
        pretty_value do
          bindings[:view].render :partial => "skills", :locals => {:object => bindings[:object] }
        end
      end
      field :experiences do
        label 'Experience'
        pretty_value do
          bindings[:view].render :partial => "experiences", :locals => {:object => bindings[:object] }
        end
      end

      field :educations do
        label 'Education'
        pretty_value do
          bindings[:view].render :partial => "educations", :locals => {:object => bindings[:object] }
        end
      end
    end
  end
end