class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :is_user_logged_in?

  def index

  end

  def current_user
	#complete this method
    @current_user = session[:user_id]
    if @current_user
      return User.find(@current_user)
    end
    return nil
  end

  def is_user_logged_in?
	 return !current_user.nil?

  	logged_in = false
	if logged_in then true else redirect_to root_path
  end
  #use cookies

  end
end
