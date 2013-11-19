class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to products_url, :notice => "You logged in, son!!"
    else
      flash.now[:alert] = "Wrong fuckin' password, yo!"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to products_url, notice => "Logged Da Fuck Out!"
  end
end
