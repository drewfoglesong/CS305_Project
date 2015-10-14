class TeachersController < ApplicationController
  before_action :logged_in_teacher
def show
  @teacher = Teacher.find(params[:id])
end
def new
  @teacher = Teacher.new
  end
  


private
  def teacher_params
    params.require(:teacher).permint(:name,:password,:password_confirmation)
  end
  
  def logged_in_teacher
      unless logged_in?
        flash[:danger] = "Nice Try"
        redirect_to login_url
      end
	  end

end