class AdminController < ApplicationController
  before_action :logged_in_Admin
def show
  @admin = Admin.find(params[:id])
end
def new
  @admin = Admin.new
  end
  


private
  def admin_params
    params.require(:admin).permint(:username,:password,:password_confirmation)
  end
  
  def logged_in_admin
      unless logged_in?
        flash[:danger] = "Nice Try"
        redirect_to login_url
      end
	  end

end
