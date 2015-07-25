class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)		# Not final implementation
  	if @user.save
      # redirects to user page, same as below:
      # redirect_to user_url(@user)
  		redirect_to @user
      flash[:success] = "Welcome to Sample App!"
  	else
  		render 'new'
  	end
  end

  private

	  def user_params
	  	params.require(:user).permit(:name, :email, :password,
	  								 :password_confirmation)
	  end

end