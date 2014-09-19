class CodesController < ApplicationController
	before_action :set_code, only: [:show, :update,:destroy]

	before_action :render_main_layout_if_format_html

	respond_to :json, :html

	def index
		respond_with @code = Code.all
	end

	def create
		respond_with Code.create(user_params)
	end

	def show
		respond_with @code_params
	end

	def update
		respond_with @code.update(code_params)
	end

	def destroy
		respond_with @code.destroy
	end


	private
	def set_code
		@code = Code.find(params[:id])
	end

	def user_params
		params.require(:code).permit(:level, :question, :correctCode, :wrongCode, :hint)
	end

	def render_main_layout_if_format_html
		# check the request format
		if request.format.symbol == :html
			render "layouts/application"
	  end
	end

end
