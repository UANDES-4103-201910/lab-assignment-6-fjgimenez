class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		@user = User.where(email: params[:session][:email]).first
    if @user && @user.password == params[:session][:password]
      session[:user_id] = @user.id
      redirect_to '/users'
    else
			flash[:notice] = 'Invalid email/password combination'
      redirect_to '/login'
    end
	end

	def destroy
		#complete this method
    session[:user_id] = nil
    redirect_to log_in_url
	end
end
