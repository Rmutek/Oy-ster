class OysterReviewsController < ApplicationController
  def index 
    @reviews = Review.all 
  end 

  def new 
    render "new.html.erb"
  end 

  def create 
    @review = Review.new(
      title: params[:title], 
      body: params[:body], 
      oyster_quality: params[:oyster_quality], 
      shucking_quality: params[:shucking_quality], 
      presentation: params[:presentation], 
      user_id: current_user.id,
      # resturant_id:, 
      # oyster_id: 
      )
  end 
end