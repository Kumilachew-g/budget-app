require 'rails_helper'

RSpec.describe 'Log In page', type: :feature do
    before :each do
        @user = User.new(name: 'Kumilachew', email: 'kumilachew@csc.et', password: '123456', password_confirmation: '123456')
        @user.save
        visit new_user_session_path
    end

    it 'should have a login form' do
        expect(page).to have_selector('form')
    end

    it 'should have a login button' do
        expect(page).to have_selector('input[type="submit"]')
    end

    it 'Can I see the input in login page' do
        expect(page).to have_field 'Email'
        expect(page).to have_field 'Password'
        expect(page).to have_button 'Log in'
      end

      it 'should be able to see authenticated route' do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
        click_button 'Log in'
        expect(page).to have_content('CATEGORIES')
      end
    
      it "shouldn't be able to enter to root route" do
        fill_in 'Email', with: 'hana@gmail.com'
        fill_in 'Password', with: '1234567'
        click_button 'Log in'
        expect(page).to have_content('Invalid Email or password.')
      end
end