class RestaurantsController < ApplicationController
  
  def index 
    @restaurants = Restaurant.all 
    render "index.html.erb"
  end 

  def show
    @restaurant = Restaurant.find_by(id: params[:id])

    sum = 0 
    @restaurant.oyster_review.each do |average| 
      sum += average.oyster_quality.to_i 
    end
    @average_oyster_quality = sum / @restaurant.oyster_review.length

    sum2 = 0 
    @restaurant.oyster_review.each do |sum| 
      sum2 += sum.shucking_quality.to_i
    end
    @average_shucking_quality = sum2 / @restaurant.oyster_review.length
    
    sum3 = 0 
    @restaurant.oyster_review.each do |sum| 
      sum3 += sum.presentation.to_i
    end 
    @presentation = sum3 / @restaurant.oyster_review.length
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
