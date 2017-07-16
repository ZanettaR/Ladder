require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  before(:each) { @request.env['devise.mapping'] = Devise.mappings[:user] }

  let(:user) { FactoryGirl.create(:user) }
  let(:invalid_attributes) { { email: user.email, password: '12345678' } }
  let(:valid_attributes) { { email: user.email, password: user.password, remember_me: '1' } }

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
      it 'assigns persisted record to an instance' do
        post :create, params: { user: valid_attributes }
        expect(assigns(:user)).to be_a_persisted
      end

      it 'creates a new session' do
        post :create, params: { user: valid_attributes }
        expect(
          session['warden.user.user.key'][0][0]
        ).to eq(User.last.id)
      end

      it 'redirects to default_post_login_path' do
        post :create, params: { user: valid_attributes }
        expect(response).to redirect_to edit_user_registration_path
      end
    end

    context 'with invalid parameters' do
      it 'does not assign persisted record to an instance' do
        post :create, params: { user: invalid_attributes }
        expect(assigns(:user)).to_not be_a_new(User)
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

  describe 'GET #destroy' do
    before(:each) { sign_in user }

    it 'destroys session' do
      get :destroy
      expect(session['warden.user.user.key']).to be_blank
    end

    it 'redirects to root_path' do
      get :destroy
      expect(response).to redirect_to root_path
    end
  end
end
