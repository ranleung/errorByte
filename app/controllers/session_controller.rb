class SessionController < ApplicationController
	# before_action :render_main_layout_if_format_html

	# respond_to :json, :html

  def new
  end

  def create
    @user = User.authenticate(params[:user][:username], params[:user][:password])
  end

  def destroy
  	respond_with session[:user_id] = nil
  end

	def render_main_layout_if_format_html
  	# check the request format
		if request.format.symbol == :html
			render "layouts/application"
	  end
  end

end
