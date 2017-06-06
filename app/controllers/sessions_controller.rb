class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      create_session(user)
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash.now[:alert] = "Invalid email or password combination. Please try again."
      render :new
    end
  end

  def destroy
    destroy_session(current_user)
    flash[:notice] = "You have signed out successully."
    redirect_to root_path
  end
end
