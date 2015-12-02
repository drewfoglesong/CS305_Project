class TeachersController < ApplicationController
  before_action :logged_in_teacher
  helper_method :sort_column, :sort_direction
def show
  @teacher = Teacher.find(params[:id])
end
def new
  @teacher = Teacher.new
  end
  
def home
end
  
def list
    @teacher = Teacher.order(sort_column + " " + sort_direction)
  end

def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      flash[:success] = "New teacher successfully added!"
      redirect_to add_remove_teacher_path
    else
      render 'new'
    end
  end

private
  def teacher_params
    params.require(:teacher).permit(:name,:password,:password_confirmation,:admin)
  end
  
  def logged_in_teacher
      unless logged_in?
        flash[:danger] = "Nice Try"
        redirect_to login_url
      end
	  end

  def sort_column
      Teacher.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

  def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
