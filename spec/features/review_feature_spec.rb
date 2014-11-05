require 'rails_helper'

describe 'reviewing' do

  before do
    User.create(id: 1, email: 'test@example.com', password:'password', password_confirmation:'password')
    @kfc = Restaurant.create(name: 'KFC', user_id: 1)
  end

  it 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  context 'Users' do

    it 'email addresses are displayed on reviews they wrote' do
      sign_up
      visit '/restaurants'
      click_link 'Review KFC'
      expect(page).not_to have_link('Sign in')
      fill_in 'Thoughts', with: "so so"
      select '3', from: 'Rating'
      click_button 'Leave Review'
      expect(current_path).to eq '/restaurants'
      expect(page).to have_content('Reviewed by: test@test.com')
    end

  end

  def sign_up
    visit '/'
    click_link('Sign up')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end


end
