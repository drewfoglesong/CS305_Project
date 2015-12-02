class StudentsController < ApplicationController
before_action :logged_in_teacher
  helper_method :sort_column, :sort_direction
  def list
    @student = Student.order(sort_column + " " + sort_direction)
  end

  def show
    @student = Student.find(params[:id])
	@in_game = true;
  end

  def new
    @student = Student.new
  end
  
  def play 
    @current_player = Student.find(params[:id])
    playing(@current_player)
    redirect_to chapter_four_path
  end

  def student_select
    @student = Student.all
  end

  def create
    @student = Student.new(student_params)
    if @student.save
    	flash[:success] = "Student successfully added!"
    	redirect_to add_remove_student_path
    else
    	render 'new'
    end
  end

  def destroy
    Student.find(params[:id]).toggle!(:active)
    if Student.find(params[:id]).active == false
      flash[:success] = "Student deactivated"
      redirect_to add_remove_student_path
    else
      flash[:success] = "Student reactivated"
      redirect_to add_remove_student_path 
    end
  end

  private

    def student_params
      params.require(:student).permit(:name, :active)
    end
	
	def logged_in_teacher
      unless logged_in?
        flash[:danger] = "Nice try"
        redirect_to login_url
      end
    end

    def sort_column
      Student.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
