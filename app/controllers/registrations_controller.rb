class RegistrationsController < ApplicationController

def new
	build_user
	 yield @user if block_given?
	 respond_with @user
end

	def create
	   #complete this method
			build_user(sign_up_params)

	    @user.save
	    yield @user if block_given?
	    if @user.persisted?
	      if @user.active_for_authentication?
	        set_flash_message! :notice, :signed_up
	        sign_up(resource_name, resource)
	        respond_with @user, location: after_sign_up_path_for(resource)
	      else
	        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
	        expire_data_after_sign_in!
	        respond_with @user, location: after_inactive_sign_up_path_for(resource)
	      end
	    else
	      clean_up_passwords @user
	      set_minimum_password_length
	      respond_with @user
	 end
	end
end
