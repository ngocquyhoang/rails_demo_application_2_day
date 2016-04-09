class UsersController < ApplicationController
  # before_action :authenticate_user?, :except => [:show, :new, :create]
  def show
    @user = User.find(params[:id])
  end

  def index
    redirect_to blogger_path
  end

  def new
    if user_signed_in?
      redirect_to current_user
    else
      @user = User.new
    end
  end

  def create
    if user_signed_in?
      redirect_to current_user
    else
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "Welcome to the Demo App!"
        redirect_to @user
      else
        flash.now[:error] = @user.errors
        render 'new'
      end
    end
  end

  def update_profile
    if params[:id_user].present?
      # byebug
      if user_signed_in? && current_user.id.to_s == params[:id_user]
        user = User.find(params[:id_user])
        user.phone = params[:phone]
        user.address = params[:address]
        if user.save
          render json:{status: "success", phone: user.phone, address: user.address }
        else
          render json:{status: "error" }
        end
      else
        render json:{status: "error" }
      end
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end
end
