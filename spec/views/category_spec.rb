require 'rails_helper'

RSpec.describe 'Category page', type: :feature do
  before :each do
    @user = User.new(name: 'Kumie', email: 'kumie@csc.et', password: '123456')
    @user.save
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    click_link 'NEW CATEGORY'
    fill_in 'Category Name', with: 'Category 1'
    fill_in 'Icon URL', with: 'icon'
    click_button 'NEXT'
  end

  it 'Should be able to see categories' do
    expect(page).to have_content('CATEGORIES')
  end

  it 'should be able to save category' do
    click_link 'NEW CATEGORY'
    fill_in 'Category Name', with: 'Category 1'
    fill_in 'Icon URL', with: 'url'
    click_button 'NEXT'
    expect(page).to have_content('Category 1')
  end

  it 'Should be able to see new category' do
    click_link 'NEW CATEGORY'
    expect(page).to have_content('NEW CATEGORY')
  end
end
