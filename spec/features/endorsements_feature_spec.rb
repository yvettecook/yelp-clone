require 'rails_helper'

describe 'Endorsing reviews' do

  before do
    User.create(id: 1, email: 'test@example.com', password:'password', password_confirmation:'password')
    kfc = Restaurant.create(name: 'KFC', user_id: 1)
    kfc.reviews.create(rating: 3, thoughts: 'It was an abomination')
  end

  it 'a user can endorse a review, which updates the review endorsement count', js: true do
    visit '/restaurants/1'
    click_link 'Endorse review'
    expect(page).to have_content('1 endorsement')
  end

end
