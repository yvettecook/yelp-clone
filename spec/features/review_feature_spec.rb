require 'rails_helper'

describe 'reviewing' do

  before do
    Restaurant.create(name: 'KFC')
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
      fill_in 'Thoughts', with: "so so"
      select '3', from: 'Rating'
      click_button 'Leave Review'
      expect(current_path).to eq '/restaurants'
      expect(page).to have_content('Reviewed by: test@example.com')
    end

  end

  def sign_up
    visit '/'
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end


end
