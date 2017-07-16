class InterestsController < ApplicationController
  def create
    binding.pry
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

  protected

  def interest_params
    params.permit(:name)
  end
end
