require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: 'atril', photo: 'www.photo.com', email: 'syedatril@gmail.com', password: 'syedatril333')
  end

  it 'returns Valid' do
    expect(@user).to be_valid
  end

  it 'returns Invalid if name is nil' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'returns Invalid if photo is nil' do
    @user.photo = nil
    expect(@user).to_not be_valid
  end

  it 'returns Invalid if email is nil' do
    @user.email = nil
    expect(@user).to_not be_valid
  end
end
