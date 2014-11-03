class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		Restaurant.create(params[:restaurant].permit(:name, :description))
		redirect_to '/restaurants'
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end


end
