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
    if Teacher.current_teacher.admin == false
      flash[:danger] = "you dont have permission to do this"
      redirect_to home_path
    else
      @teacher = Teacher.order(sort_column + " " + sort_direction)
    end
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

def destroy
    if Teacher.find(params[:id]).admin == false
      Teacher.find(params[:id]).toggle!(:active)
      if Teacher.find(params[:id]).active == false
        flash[:success] = "Teacher deactivated"
        redirect_to add_remove_teacher_path
      else
        flash[:success] = "Teacher reactivated"
        redirect_to add_remove_teacher_path 
      end
    else
      flash[:danger] = "You don't have permission to deactivate admin accounts"
      redirect_to add_remove_teacher_path
    end
  end

def edit
  @teacher = Teacher.find(params[:id])
  if (Teacher.current_teacher != @teacher) && (Teacher.current_teacher.admin == false) || (Teacher.current_teacher != @teacher) && (@teacher.admin == true)
      flash[:danger] = "you dont have permission to do this"
      redirect_to home_path
    end
  end

def update
  @teacher = Teacher.find(params[:id])
  if @teacher.update_attributes(teacher_params)
    flash[:success] = "Profile updated"
    redirect_to home_path
  else
    render 'edit'
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
