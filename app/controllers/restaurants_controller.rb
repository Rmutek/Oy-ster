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

  def filter 
    render "filter.html.erb"
  end 

  def smh
    render "smh.html.erb"
  end 

  def about
    render "about.html.erb"
  end 
end
