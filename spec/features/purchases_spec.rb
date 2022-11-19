require 'rails_helper'

RSpec.describe 'Expenses page', type: :feature do
  before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    @user = User.create(
      name: 'Abraha',
      email: 'abrahak81@gmail.com',
      password: '123456'
    )
    visit user_session_path
    fill_in 'Email', with: @user.email.to_s
    fill_in 'Password', with: @user.password.to_s
    find("input[type='submit']").click

    @group = Group.create!(name: 'Shopping',
                           icon: 'https://png.pngtree.com/png-clipart/20220626/
original/pngtree-plane-travel-logo-vector-template-png-image_8185591.png', author_id: @user.id)
    @purchase = Purchase.create!(name: 'Dress', amount: 20, author_id: @user.id)
    @group_purchase = GroupPurchase.create!(group_id: @group.id, purchase_id: @purchase.id)
    visit group_purchases_path(@group)
  end

  it 'should show the purchase name' do
    expect(page).to have_content('Dress')
  end

  it 'should show the category name' do
    expect(page).to have_content('Shopping')
  end

  it 'should show the dress amount' do
    expect(page).to have_content(20)
  end

  it 'should have a button to add a new expense' do
    expect(page).to have_content('Add A Purchase')
  end

  it 'Add expense should navigate to form page' do
    click_link 'Add A Purchase'
    expect(current_path).to eq(new_group_purchase_path(@group))
  end
end
