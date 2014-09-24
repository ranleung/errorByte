class UsersController < ApplicationController
	before_action :set_user, only: [:show, :update,:destroy]

	before_action :render_main_layout_if_format_html

	respond_to :json, :html

	def index
		respond_with @user = User.all
	end

	def new 
	end

	def create
		p user_params
		respond_with User.create(user_params)
	end

	def show
		respond_with set_user
	end

	def update
		respond_with @user.update(user_params)
	end

	def destroy
		respond_with @user.destroy
	end
	

	private
	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:username, :password)
	end

	def render_main_layout_if_format_html
		# check the request format
  	if request.format.symbol == :html
  		render "layouts/application"
    end
	end


end
