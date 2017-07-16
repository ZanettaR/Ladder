class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def redirect_nunathenticated_users
    redirect_to users_profile2_path
    end
end
