class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def index
    
  end

  def new 
    @restaurant = Restaurant.new
  end
end
