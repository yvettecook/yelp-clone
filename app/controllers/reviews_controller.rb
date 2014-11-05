class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(user: current_user)
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    if user_signed_in?
      @user_id = current_user.id
    else
      @user = nil
    end
    @restaurant.reviews.create(params[:review].permit(:thoughts, :rating).merge(user_id: @user_id))
    redirect_to restaurants_path
  end


end
