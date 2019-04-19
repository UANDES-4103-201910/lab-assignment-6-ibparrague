class SessionsController < ApplicationController
	def new
	end

	def log_in(user)
    session[:user_id] = user.id
  end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	def create
		#complete this method
		user = User.find_by(email: params[:session][:email].downcase, password: params[:session][:password])
    if user.present?
      log_in user
      redirect_to user , notice: "Log in Successfully, no idea why this appears twice."
    else
      redirect_to root_url, notice: 'Invalid email/password combination'
    end
	end

	def destroy
		#complete this method
		log_out
		redirect_to root_url
	end
end
