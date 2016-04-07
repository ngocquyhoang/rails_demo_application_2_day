module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    !current_user.nil?
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end

  def authenticate_user?
    if !user_signed_in?
      redirect_to sign_in_path
      flash[:error] = 'Please sign in !'
    end
  end
  
end
