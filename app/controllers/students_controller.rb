class StudentsController < ApplicationController

  def list
    @student = Student.all
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

  def destroy
    Student.find(params[:id]).destroy
    flash[:success] = "Student Deleted"
    redirect_to add_remove_student_path
  end

  private

    def student_params
      params.require(:student).permit(:name, :active)
    end
end
