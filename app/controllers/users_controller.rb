class UsersController < ApplicationController
  layout :set_layout

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  protected

  def set_layout
    'layouts/templates/dashboard'
  end
end
