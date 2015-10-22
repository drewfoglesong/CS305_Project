class StudentsController < ApplicationController

  def list
  end

  def show
  	@student = Student.fine(params[:id])
  end

  def new
  	@student = Student.new
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

  private

    def student_params
      params.require(:student).permit(:name, :active)
    end
end
