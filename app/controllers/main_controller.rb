class MainController < ApplicationController

	skip_before_filter :authorize
	
	def index

		if current_user.nil?

			@user = User.new

			render 'splash',layout: 'splash'

		else

			render

		end

	end

	def create

		@user = User.new params[:user]

		if @user.save

			session[:user_id] = @user.id

			redirect_to root_url, notice: "Thank you for signing up!"

		else

			render 'splash',layout: 'splash'

		end

	end

end