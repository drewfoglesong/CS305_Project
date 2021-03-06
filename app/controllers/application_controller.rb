class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include StudentsHelper
  include DashboardHelper
  include TeachersHelper
  
  before_filter :set_current_teacher

  def set_current_teacher
  	Teacher.current_teacher = current_user
  end
end
