class RegistrationsController < ApplicationController

	def new
      # super
			@user = User.new
     end

	def create
   #complete this method
	 @user = User.new(registration_params)
	 respond_to do |format|
     if @user.save
       flash[:notice] = "You have signed up successfully."
       format.html { redirect_to login_path }
     else
		 	 flash[:notice] = "The user could not be created, sorry."
       format.html { render :action => :new }
       format.json { render json: @user.errors }
     end
	 end
end

def update
	# super
 end

 private
   # Never trust parameters from the scary internet, only allow the white list through.
   def registration_params
     params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
   end
end
