class SpecialtiesController < ApplicationController
  def create
    @tag = Tag.find_or_create_by(specialty_params)
    @specialty = current_user.user_specialties.build(tag_id: @tag.id)
    respond_to do |format|
      if @specialty.save
        format.html { redirect_to edit_user_registration_path, success: 'tag was success' }
      else
        format.html { redirect_to edit_user_registration_path, failure: 'tag has errors' }
      end
    end
  end

  protected

  def specialty_params
    params.require(:specialty).permit(:name)
  end
end
