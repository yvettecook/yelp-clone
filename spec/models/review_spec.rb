require 'spec_helper'

RSpec.describe Review, :type => :model do

  it 'is invalid if the rating is more than 5' do
    review = Review.new(rating: 10)
    expect(review).to have(1).error_on(:rating)
  end

  it 'is invalid if the rating is less than 1' do
    review = Review.new(rating: -1)
    expect(review).to have(1).error_on(:rating)
  end

  it 'is valid if the rating is between 1 and 5' do
    review = Review.new(rating: 3)
    expect(review).to have(0).error_on(:rating)
  end

  context 'Relationships' do

    it 'should be linked to User' do
      user = User.create(email: 'test@example.com',password:'password',password_confirmation:'password')
      restaurant = Restaurant.create(name:'hix')
      review = Review.create(thoughts: 'great', restaurant: restaurant, user_id: user.id, rating: 4)
      expect(review.user.email).to eq('test@example.com')
    end

    it 'should only allow one review per user per restaurant' do
      user = User.create(email: 'test@example.com',password:'password',password_confirmation:'password')
      restaurant = Restaurant.create(name:'hix')
      review = Review.create(thoughts: 'great', restaurant: restaurant, user_id: user.id, rating: 4)
      review2 = Review.create(thoughts: 'great', restaurant: restaurant, user_id: user.id, rating: 4)
      expect(review2).to have(1).error
    end

    it 'can have 2 anonymous reviews per restaurant' do
      
    end

  end

end
