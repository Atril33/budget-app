require 'rails_helper'
require 'capybara/rspec'


RSpec.describe 'Categories #index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'atril', email: 'syedatril@gmail.com', password: 'syedatril333')
    @category1 = Category.create(name: 'my category 1st', icon: 'www.myicon/path/icon.png', user: @user)
    @category2 = Category.create(name: 'my category 2nd', icon: 'www.myicon/path/icon.png', user: @user)

    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Login'

    visit categories_path
  end

  it 'I can see a Payments text' do
    expect(page).to have_content('Payments')
  end

  it 'I can see a Log Out button' do
    expect(page).to have_content('Log out')
  end

  it 'I can see all categories all contents' do
    @user.categories.each do |category|
      expect(page).to have_content(category.name)
      expect(page).to have_content(category.cash_trackers.sum(:amount))
    end
  end

  it 'I can see a Add Payment button' do
    expect(page).to have_content('Add Payment')
  end

  it 'When I click to Add Payment button, it redirects me Add Payment Page.' do
    click_on 'Add Payment'
    expect(page).to have_current_path(new_category_path)
  end

  it 'I can go payment details page when click on a specific payment name' do
    click_on 'my category 2nd'
    expect(page).to have_current_path(category_path(@category2))
  end
end
