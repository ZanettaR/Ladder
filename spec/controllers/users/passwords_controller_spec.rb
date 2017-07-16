require 'rails_helper'

RSpec.describe Users::PasswordsController, type: :controller do
  before { @request.env['devise.mapping'] = Devise.mappings[:user] }

  let(:user) { FactoryGirl.create(:user) }

  let(:valid_attributes) {
    { email: user.email, password: '12345678', password_confirmation: '12345678' }
  }
  let(:invalid_attributes) {
    { email: 'unregisteredemail@mail.com', password: '1234' }
  }

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'assigns a new record to an instance' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'sets reset_password_token' do
        post :create, params: { user: valid_attributes }
        user.reload
        expect(user.reset_password_token).to be_present
      end

      it 'sets reset_password_sent_at' do
        post :create, params: { user: valid_attributes }
        user.reload
        expect(user.reset_password_sent_at).to be_present
      end

      it 'sends reset password instructions' do
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(ActionMailer::Base.deliveries, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not set reset_password_token' do
        post :create, params: { user: invalid_attributes }
        user.reload
        expect(user.reset_password_token).to be_blank
      end

      it 'does not set reset_password_sent_at' do
        post :create, params: { user: invalid_attributes }
        user.reload
        expect(user.reset_password_sent_at).to be_blank
      end

      it 'does not send reset password instructions' do
        post :create, params: { user: invalid_attributes }
        expect(ActionMailer::Base.deliveries).to be_empty
      end
    end
  end

  describe 'GET #edit' do
    context 'with valid parameters' do
      it 'returns http success' do
        user.send_reset_password_instructions
        get :edit, params: { reset_password_token: user.reset_password_token }
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid parameters' do
      it 'redirects user' do
        get :edit, params: { reset_password_token: user.reset_password_token }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      before do
        valid_attributes.merge!(
          reset_password_token: user.send_reset_password_instructions
        )
      end

      it 'persists new password' do
        patch :update, params: { user: valid_attributes }
        user.reload
        expect(user.valid_password?('12345678')).to eq(true)
      end

      it 'redirects to post reset password path' do
        patch :update, params: { user: valid_attributes }
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'with invalid parameters' do
      it 'does not persist new password' do
        patch :update, params: { user: valid_attributes }
        user.reload
        expect(user.valid_password?('12345678')).to eq(false)
      end

      it 're-renders edit view' do
        patch :update, params: { user: valid_attributes }
        expect(response).to render_template :edit
      end
    end
  end
end
