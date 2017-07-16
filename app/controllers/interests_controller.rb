class InterestsController < ApplicationController

  layout :set_layout, only: :search

  def create
    @tag = Tag.find_or_create_by(interest_params)
    @interest = current_user.user_interests.build(tag_id: @tag.id)
    respond_to do |format|
      if @interest.save
        format.html { redirect_to edit_user_registration_path, success: 'tag was success' }
      else
        format.html { redirect_to edit_user_registration_path, failure: 'tag has errors' }
      end
    end
  end

  def destroy
    @interest = UserInterest.find(params[:id])
    respond_to do |format|
      if  @interest.destroy
        format.html { redirect_to edit_user_registration_path, success: 'successfully deleted' }
      else
        format.html { redirect_to edit_user_registration_path, failure: 'could not be deleted' }
      end
    end
  end

  def search
    respond_to do |format|
      @interests = UserSpecialty.where(tag_id: Tag.find_by_name(params[:id]))
      @users = @interests.pluck(:user_id).map { |id| User.find(id) }
      format.html { render 'users/search' }
    end
  end

  protected

    def set_layout
      'templates/dashboard'
    end

  def interest_params
    params.permit(:name)
  end
end
