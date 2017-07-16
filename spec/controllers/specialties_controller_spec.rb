require 'rails_helper'

RSpec.describe SpecialtiesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:tag) }
  let(:invalid_attributes) { { tag: '' } }

  before(:each) { sign_in user }

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'persists new tag record' do
        expect do
          post :create, params: { specialty: valid_attributes }
        end.to change(Tag, :count).by(1)
      end

      it 'persists new specialty record' do
        expect do
          post :create, params: { specialty: valid_attributes }
        end.to change(UserSpecialty, :count).by(1)
      end
    end
  end
end
