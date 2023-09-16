require 'rails_helper'
require 'capybara/rspec'


RSpec.describe 'Categories #Show page', type: :feature do
  before(:each) do
    @user = User.create(name: 'atril', email: 'syedatril@gmail.com', password: 'syedatril333')
    @category = Category.create(name: 'my category 1st', icon: 'www.myicon/path/icon.png', user: @user)
    @cash_tracker1 = CashTracker.create(name: 'my cash tracker 1st', amount: 1003.20, categories_id: @category.id,
                                        user_id: @user.id)
    @cash_tracker2 = CashTracker.create(name: 'my cash tracker 2nd', amount: 100.20, categories_id: @category.id,
                                        user_id: @user.id)

    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Login'

    visit category_path(@category)
  end

  it 'I can see a TRANSACTIONS text' do
    expect(page).to have_content('TRANSACTIONS')
  end

  it 'I can see a Log Out button' do
    expect(page).to have_content('Log out')
  end

  it 'I can see all categories all contents' do
    @category.cash_trackers.each do |cash_tracker|
      expect(page).to have_content(cash_tracker.name)
      expect(page).to have_content(cash_tracker.amount)
      expect(page).to have_content(cash_tracker.sum(:amount))
    end
  end

  it 'I can see a Add Transaction button' do
    expect(page).to have_content('Add Transaction')
  end

  it 'When I click to Add Transaction button, it redirects me Add Transaction Page.' do
    click_on 'Add Transaction'
    expect(page).to have_current_path(new_category_cash_tracker_path(@category))
  end
end
