class SessionController < ApplicationController
  before_action :render_main_layout_if_format_html

  respond_to :json, :html

  def new
  end

  def create
    @user = User.authenticate(params[:user][:username], params[:user][:password])
  
    if @user 
      session[:user_id] = @user.id
      respond_to do |format|
        format.json {render :json => @user, :only => [:username, :password]}
      end
    end
  end

  def destroy
  	session[:user_id] = nil
    respond_with nil
  end

	def render_main_layout_if_format_html
  	# check the request format
		if request.format.symbol == :html
			render "layouts/application"
	  end
  end

end
