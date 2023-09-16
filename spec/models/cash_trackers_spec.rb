require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create(name: 'atril', email: 'syedatril@gmail.com', password: 'syedatril333')
    @category = Category.create(name: 'my category', icon: 'www.myicon/path/icon.png', user: @user)
    @cash_tracker = CashTracker.create(name: 'my cash tracker', amount: 100.20, categories_id: @category.id, user_id: @user.id)
  end

  it 'returns Valid' do
    expect(@user).to be_valid
  end

  it 'returns Invalid if name is nil' do
    @category.name = nil
    expect(@category).to_not be_valid
  end

  it 'returns Invalid if icon is nil' do
    @category.icon = nil
    expect(@category).to_not be_valid
  end

  it 'returns Invalid if user is nil' do
    @category.user = nil
    expect(@category).to_not be_valid
  end

  it 'returns Invalid if user_id is nil' do
    @category.user_id = nil
    expect(@category).to_not be_valid
  end
end
