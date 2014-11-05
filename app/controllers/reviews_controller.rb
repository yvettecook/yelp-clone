class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(user: current_user)
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @user_id = current_user.id if user_signed_in?
    @restaurant.reviews.create(params[:review].permit(:thoughts, :rating).merge(user_id: @user_id))
    if @restaurant.save
      redirect_to restaurants_path
    else
      redirect_to restaurants_path
      flash[:notice] = 'Sorry, you can only review a restaurant once'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to '/restaurants'
  end


end
