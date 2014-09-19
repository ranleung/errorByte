class CompletesController < ApplicationController
	before_action :set_complete, only: [:show, :update,:destroy]

	before_action :render_main_layout_if_format_html

	respond_to :json, :html

	def index
		respond_with @complete = Complete.all
	end

	def show
		respond_with @complete_params
	end

	def update
		respond_with @complete.update(complete_params)
	end

	private
	def set_complete
		@complete = Complete.find(params[:id])
	end

	def complete_params
		params.require(:complete).permit(:completed)
	end

	def render_main_layout_if_format_html
	# check the request format
		if request.format.symbol == :html
			render "layouts/application"
	  end
	end
end
