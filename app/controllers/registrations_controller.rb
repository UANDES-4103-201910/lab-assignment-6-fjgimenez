class RegistrationsController < ApplicationController

	def new
      # super
     end

	def create
	   #complete this method
		 @user = User.new(params[:user])
     if @user.save
       flash[:notice] = "You have signed up successfully."
       redirect_to '/home'
     else
       render :action => :new
	end
end

def update
	# super
 end
end
