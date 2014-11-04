class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @user = User.find(params[:user_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @user = User.find(params[:user_id])
    @restaurant.reviews.create(params[:review].permit(:thoughts, :rating))
    redirect_to restaurants_path
  end

end
