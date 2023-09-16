require 'rails_helper'

RSpec.describe 'CashTrackers', type: :request do
  before(:each) do
    @user = User.create(name: 'atril', email: 'syedatril@gmail.com', password: 'syedatril333')
    @category = Category.create(name: 'my category', icon: 'www.myicon/path/icon.png', user: @user)
    @cash_tracker = CashTracker.create(name: 'my cash tracker', amount: 100.20, categories_id: @category.id,
                                       user_id: @user.id)
  end
  describe 'GET /new' do
    it 'returns http success' do
      sign_in @user
      get '/categories/new'
      expect(response).to have_http_status(:success)
    end
  end
end
