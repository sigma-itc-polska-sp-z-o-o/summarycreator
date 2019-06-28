# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    can :access, :rails_admin

    if user.admin?;
      can :manage, :all
    end
    can [:index, :update, :show], User, :email => user.email unless user.admin?
    can [:read, :create], Skill
  end
end