class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		# Log the user in and redirect to the users's show page
  	else
  		# flash error message for only one request
  		flash.now[:danger] = 'Invalid email/password combination' # Sloppy
  		render 'new'
  	end
  end

  def destroy
  end
end
