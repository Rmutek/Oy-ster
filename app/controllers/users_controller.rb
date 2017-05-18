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

  
end 
