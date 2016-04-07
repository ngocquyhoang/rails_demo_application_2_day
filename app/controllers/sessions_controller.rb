class SessionsController < ApplicationController
  def new
    if user_signed_in?
      redirect_to current_user
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = 'Sign in successfull'
      redirect_to current_user
    else
      flash.now[:error] = 'Invalid email or password combination !'
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:success] = 'Sign out successfull'
    redirect_to root_url
  end
end
