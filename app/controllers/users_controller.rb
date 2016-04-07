class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Welcome to the Demo App!"
      redirect_to @user
  	else
  		flash[:error] = @user.errors
      render 'new'

    end
  end

  def update_profile
  	if params[:id_user].present?
  		user = User.find(params[:id_user])
  		user.phone = params[:phone]
  		user.address = params[:address]
  		byebug
  		if user.save
  			# flash[:success] = "Successfull update your profile"
  			render json:{status: "success", phone: user.phone, address: user.address }
  		else
  			# flash[:error] = "False to update profile"
  			render json:{status: "error" }
  		end
  	end
  end

	private

    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end
end
