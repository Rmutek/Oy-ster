class RestaurantsController < ApplicationController
  
  def index 
    @restaurants = Restaurant.all 
    render "index.html.erb"
  end 

  def show
    @restaurant = Restaurant.find_by(id: params[:id])

    sum = 0 
    @average_oyster_quality = @restaurant.oyster_review.each do |average| 
      sum += average.oyster_quality 
    end 
    render "show.html.erb"
  end 

  def home
    @restaurants = Restaurant.all 
    render "home.html.erb"
  end 

  def filter 
    render "filter.html.erb"
  end 
end
