class UsersController < ApplicationController
  def new 
    render "new.html.erb"
  end 

  def create 
    user = User.new(
      user_name: params[:user_name],
      email: params[:email],
      first_name: params[:first_name],
      last_name: params[:last_name],
      dob: params[:dob],
      password: params[:password],
      password_confirmation: params[:password_confirmation])

    if user.save 
      session[:user_id] = user.id
      flash[:success] = "Account Created!"
      redirect_to "/"
    else 
      flash[:warning] = "Invalid Email Address!"
      redirect_to "/signup"
    end 
  end

  def show 
    @review = OysterReview.all

    sum = 0 
    @review.each do |post|
      if post.user_id == current_user.id
        sum += post.user_id.to_i
      end 
    end 
    @total = sum / current_user.id

  @message =  
    if @total == 0 
      "Post your first review"
    elsif @total <= 1
      "Level One: Thank you for sharing! You have earned one Oy'ster stick. Display this sticker proudly to show that you support a community of like-minded oyster lovers"
    elsif @total <= 3 
      "Level 2: Keep Shucking! You have earned two free oysters. Show this to your server at any Oy'ster restaurant and you will receive an oyster for you and a firend"
    elsif @total <= 5 
      "Level 3: You are shucking fantastic! To thank you for making Oy'ster a success you have been invited to mingle with your fellow Oy'ster lovers at an Oy'ster happy hour"
    else @total <=10 
      "Level 4: Pearl. Come enjoy a day of oysters and live music at Oy'ster Fest"
    end 

    @name = current_user.first_name

    render "show.html.erb"
  end 

  
end 
