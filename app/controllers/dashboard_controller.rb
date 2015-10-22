class DashboardController < ApplicationController
before_action :logged_in_teacher

  def add_remove_students
  end
  
  def home
  end
  
  private
  def logged_in_teacher
      unless logged_in?
        flash[:danger] = "Nice try"
        redirect_to login_url
      end
    end
end
