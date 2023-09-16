require 'rails_helper'
require 'capybara/rspec'


RSpec.describe 'Categories #index page', type: :feature do
  before(:each) do
    visit home_path
  end

  it 'I can see name of app Cash Tracker' do
    expect(page).to have_content('Cash Tracker')
  end

  it 'I can see a Login button' do
    expect(page).to have_content('Login')
  end


  it 'I can see a Sign Up button' do
    expect(page).to have_content('Sign Up')
  end

  it 'When I click to Login button, it redirects me Login Page.' do
    click_on 'Login'
    expect(page).to have_current_path(new_user_session_path)
  end

  it 'When I click to Sign Up button, it redirects me Sing Up Page.' do
    click_on 'Sign Up'
    expect(page).to have_current_path(new_user_registration_path)
  end
end
