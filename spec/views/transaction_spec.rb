require 'rails_helper'

RSpec.describe 'Transaction page', type: :feature do
  before :each do
    @user = User.new(name: 'Kumie', email: 'kumie@csc.et', password: '123456')
    @user.save
    @category = Group.new(name: 'Category 1', icon: 'icon')
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    click_link 'NEW CATEGORY'
    fill_in 'Category Name', with: @category.name
    fill_in 'Icon URL', with: @category.icon
    click_button 'NEXT'
  end

    it 'Should be able to see transactions' do
        click_on 'Category 1'
        expect(page).to have_content('TRANSACTIONS')
        end

    it 'Should be able to see new transaction' do
        click_on 'Category 1'
        click_link 'NEW TRANSACTION'
        expect(page).to have_content('NEW TRANSACTION')
        end

        it 'Should be able to save transaction' do
            click_on 'Category 1'
            click_link 'NEW TRANSACTION'
            fill_in 'Name', with: 'Trans 1'
            fill_in 'Amount', with: 5
            first('#entity_group_ids option', minimum: 1).select_option
            click_button 'NEXT'
            click_on 'Category 1'
            expect(page).to have_content('Trans 1')
        end
end