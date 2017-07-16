require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  before(:each) { @request.env['devise.mapping'] = Devise.mappings[:user] }

  let(:user) { FactoryGirl.create(:user) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:user) }
  let(:invalid_attributes) { { email: '', password: '' } }

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
      it 'persists new record' do
        expect do
          post :create, params: { user: valid_attributes }
        end.to change(User, :count).by(1)
      end

      it 'creates a new session' do
        post :create, params: { user: valid_attributes }
        expect(session['warden.user.user.key'][0][0]).to eq(User.last.id)
      end

      it 'redirects to post_signup_path' do
        post :create, params: { user: valid_attributes }
        expect(response).to redirect_to edit_user_registration_path
      end
    end

    context 'with invalid attributes' do
      it 'does not persist record' do
        expect do
          post :create, params: { user: invalid_attributes }
        end.to change(User, :count).by(0)
      end

      it 'does not create a new session' do
        post :create, params: { user: invalid_attributes }
        expect(session['warden.user.user.key']).to be_blank
      end

      it 'renders action :new' do
        post :create, params: { user: invalid_attributes }
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    before(:each) { sign_in user }

    it 'returns http success' do
      get :edit
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH #update' do
    before(:each) { sign_in user }
    let(:valid_attributes) {
      FactoryGirl.attributes_for(:user, :updateable, password: '12345678')
    }

    context 'with valid parameters' do
      it 'updates record' do
        put :update, params: { user: valid_attributes }
        user.reload
        expect(user.email).to eq(valid_attributes[:email])
        expect(user.valid_password?('12345678')).to eq true
      end
    end
  end

  describe 'DELETE #destroy' do
    before(:each) { sign_in user }

    context 'with valid parameters' do
      it 'destroys record' do
        expect { delete :destroy }.to change(User, :count).by(-1)
      end

      it 'destroys session' do
        delete :destroy
        expect(session['warden.user.user.key']).to be_blank
      end

      it 'redirects to root_path' do
        delete :destroy
        expect(response).to redirect_to root_path
      end
    end
  end
end
