require_relative '../rails_helper'

RSpec.describe 'Categories page', type: :feature do
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

    @group = Group.new(name: 'Travel', icon: 'https://png.pngtree.com/png-clipart/20220626/original/pngtree-plane-travel-logo-vector-template-png-image_8185591.png', author_id: 1)
    @group.author_id = @user.id
    @group.save
  end

  it 'shows the heading Categories' do
    visit groups_path
    expect(page).to have_content('Groups')
  end

  it 'shows the Travel category name' do
    visit groups_path
    expect(page).to have_content('Travel')
  end

  it 'shows the Add category button' do
    visit groups_path
    expect(page).to have_content('Add A Group')
  end

  it 'shows the category name' do
    visit groups_path
    expect(page).to have_content(@group.name.to_s)
  end

  it 'Add category button should navigate to new page' do
    click_on 'Add A Group'
    expect(current_path).to eq(new_group_path)
  end

end