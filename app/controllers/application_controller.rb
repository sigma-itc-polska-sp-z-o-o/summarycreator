class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    return rails_admin.show_path(model_name: :user, id: current_user.id) unless current_user && current_user.admin?
    rails_admin.dashboard_path
  end

  rescue_from CanCan::AccessDenied do
    redirect_to rails_admin.show_path(model_name: :user, id: current_user.id)
  end
end
