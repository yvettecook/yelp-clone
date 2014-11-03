class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurants = Restaurant.new
	end

	def create
		Restaurant.create(params[:restaurant].permit(:name))
		redirect_to '/restaurants'
	end

end
