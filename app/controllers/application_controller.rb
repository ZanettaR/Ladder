class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :redirect_authenticated_users, :redirect_unauthenticated_users

  def redirect_authenticated_users
    redirect_to edit_user_registration_path if current_user
  end

  def redirect_unauthenticated_users
    redirect_to new_user_registration_path if !current_user
  end
end
