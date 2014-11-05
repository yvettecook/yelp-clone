class RestaurantsController < ApplicationController

	before_action :authenticate_user!, :except => [:index, :show]

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		# @restaurant.reviews.create(params[:review].permit(:thoughts, :rating).merge(user_id: @user))
		@restaurant = Restaurant.create(params[:restaurant].permit(:name, :description, :image).merge(user_id: current_user.id))
		if @restaurant.save
			redirect_to restaurants_path
		else
			render 'new'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		@restaurant.update(params[:restaurant].permit(:name, :description, :image))
		redirect_to '/restaurants'
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		if current_user.id == @restaurant.user_id
			@restaurant.destroy
			redirect_to '/restaurants'
			flash[:notice] = 'Restaurant deleted successfully'
		else
			redirect_to '/restaurants'
			flash[:notice] = 'Permission denied'
		end
	end

end
