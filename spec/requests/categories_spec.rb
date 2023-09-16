require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  before(:each) do
    @user = User.create(name: 'atril', email: 'syedatril@gmail.com', password: 'syedatril333')
    @category = Category.create(name: 'my category', icon: 'www.myicon/path/icon.png', user: @user)

  end

  describe 'GET /index' do
    it 'returns http success' do
      sign_in @user
      get '/categories'
      expect(response).to have_http_status(:success)
    end

    it 'should render the food index action correctly' do
      sign_in @user
      get '/categories'
      expect(response).to be_successful
      expect(response.body).to include('my category')
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      sign_in @user
      get '/categories/new'
      expect(response).to have_http_status(:success)
    end
  end
end