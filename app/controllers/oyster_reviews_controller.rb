class OysterReviewsController < ApplicationController
  def index 
    @reviews = Review.all 
  end 

  def new 
    @oysters = Oyster.all
    render "new.html.erb"
  end 

  def create 
    restaurant = Restaurant.find_by(name: params[:name])
    oyster = Oyster.find(params[:oyster])
    review = OysterReview.new(
        title: params[:title], 
        body: params[:body], 
        oyster_quality: params[:oyster_quality], 
        shucking_quality: params[:shucking_quality], 
        presentation: params[:presentation], 
        user_id: current_user.id,
        restaurant_id: restaurant.id,
        oyster_id: oyster.id
        )
    if review.save
      redirect_to "/"
    else
      redirect_to "/newreview"
    end
  end 
end
