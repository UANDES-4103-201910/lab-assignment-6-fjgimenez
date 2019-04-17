class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		@user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/home'
    else
			flash[:danger] = 'Invalid email/password combination'
      redirect_to '/login'
    end
	end

	def destroy
		#complete this method
		User.find(session[:user_id]).destroy
    session[:user_id] = nil
    redirect_to '/forsale'
	end
end
