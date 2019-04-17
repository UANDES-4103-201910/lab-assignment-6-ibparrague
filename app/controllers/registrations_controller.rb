class RegistrationsController < ApplicationController
	def new

	end

	def create
			@user = User.create(reg_params)
			#flash[:notice] = @user.name

			if @user.save
				flash[:notice] = "You have registered successfully."
				redirect_to root_url
			else
				flash[:notice] = "Error creating registration."
				redirect_to registrations_url
			end
	end


	def reg_params
		params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
	end
end
