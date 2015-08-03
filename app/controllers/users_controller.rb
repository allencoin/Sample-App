class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)		# Not final implementation
  	if @user.save
      log_in @user
      # redirects to user page, same as below:
      # redirect_to user_url(@user)
  		redirect_to @user
      flash[:success] = "Welcome to Sample App!"
  	else
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update
    else
      render 'edit'
    end
  end

  private

	  def user_params
	  	params.require(:user).permit(:name, :email, :password,
	  								 :password_confirmation)
	  end

end