class RestaurantsController < ApplicationController
  
  def index 
    @restaurants = Restaurant.all 
    render "index.html.erb"
  end 

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
    render "show.html.erb"
  end 

  def home
    @restaurants = Restaurant.all 
    render "home.html.erb"
  end 
end
