require 'rails_helper'

RSpec.describe InterestsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:tag) }
  let(:invalid_attributes) { { tag: '' } }

  before(:each) { sign_in user }

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'persists new tag record' do
        expect do
          post :create, params: { interest: valid_attributes }
        end.to change(Tag, :count).by(1)
      end

      it 'persists new interest record' do
        expect do
          post :create, params: { interest: valid_attributes }
        end.to change(UserInterest, :count).by(1)
      end

      # it 'redirects to post_signup_path' do
      #   post :create, params: { user: valid_attributes }
      #   expect(response).to redirect_to edit_user_registration_path
      # end
    end
  end
end
