class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new

		@user.user_name = params[:users][:user_name]
		@user.first_name = params[:users][:first_name]
	    @user.last_name = params[:users][:last_name]
	    @user.email = params[:users][:email]
	    @user.password = params[:users][:password]
	    @user.password_confirmation = params[:users][:password_confirmation]

        if @user.save
		  # if request.xhr?
		  #   render json: {sign_up: render_to_string('layouts/_header', layout: false)}
		  # else
		    redirect_to root_path
		  # end

		else
		  flash.now[:alert] = 'Unsuccessful Sign Up'
		  # if request.xhr?
		  #   render json: {failed: render_to_string('_errorSignup', layout: false)}
		  # else
		    render :new
		  # end

		end
	    
	end
end
