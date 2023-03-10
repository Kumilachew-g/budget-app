require 'rails_helper'

RSpec.describe 'Register page', type: :feature do
  before :each do
    @user = User.new(name: 'Kumilachew', email: 'kumie@csc.et', password: '123456', password_confirmation: '123456')
    @user.save
    visit new_user_registration_path
  end

  it 'I can see the input in register page' do
    expect(page).to have_field 'Full name'
    expect(page).to have_field 'Email'
    expect(page).to have_field 'Password'
    expect(page).to have_field 'Confirm Password'
    expect(page).to have_button 'Next'
  end

  it "Shouldn't be able to enter to root route because the data is invalid" do
    fill_in 'Full name', with: 'Kumilachew'
    fill_in 'Email', with: 'kumiecsc.et'
    fill_in 'Password', with: '1234'
    fill_in 'Confirm Password', with: '1234'
    click_button 'Next'
    expect(page).to have_content('2 errors')
    expect(page).to have_content('Email is invalid')
    expect(page).to have_content('Password is too short (minimum is 6 characters)')
  end

  it "Shouldn't be able to enter to root route because the data is empty" do
    fill_in 'Full name', with: ''
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Confirm Password', with: ''
    click_button 'Next'
    expect(page).to have_content('3 errors')
    expect(page).to have_content('Email can\'t be blank')
    expect(page).to have_content('Password can\'t be blank')
    expect(page).to have_content('Name can\'t be blank')
  end

  it "shouldn't be able to enter to root route because email already taken" do
    @user.save
    fill_in 'Full name', with: @user.name
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    fill_in 'Confirm Password', with: @user.password_confirmation
    click_button 'Next'
    expect(page).to have_content('1 error')
    expect(page).to have_content('Email has already been taken')
  end

  it 'Should be able to enter to root route because the data is valid' do
    fill_in 'Full name', with: 'Kumilachew'
    fill_in 'Email', with: 'kumie@csc.et'
    fill_in 'Password', with: '123456'
    fill_in 'Confirm Password', with: '123456'
    click_button 'Next'
    expect(page).to have_content('')
  end

  it "shouldn't be able to enter to root route because the pass don't match confirm" do
    fill_in 'Full name', with: @user.name
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    fill_in 'Confirm Password', with: ''
    click_button 'Next'
    expect(page).to have_content('Password confirmation doesn\'t match Password')
  end
end
