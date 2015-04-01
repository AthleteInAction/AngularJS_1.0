class SessionsController < ApplicationController

	skip_before_filter :authorize

	def new

		render 'login',layout: 'splash'

	end

	def create

		user = User.find_by_email params[:email]

		if user && user.authenticate(params[:password])

			session[:user_id] = user.id

			redirect_to root_url, flash: {success: 'Logged in!'}

		else

			flash[:danger] = 'Email or password is invalid'

			render 'login',layout: 'splash'

		end

	end

	def destory

		session.delete :user_id

		redirect_to root_url, flash: {warning: 'You have been logged out!'}

	end

end