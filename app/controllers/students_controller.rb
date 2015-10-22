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
    flash[:success] = "Student deleted"
    redirect_to add_remove_student_url
  end

  def toggle
    @student = Student.find(params[:id])
    if @student.active == true
      student.update_attributes(active: false)
      flash[:success] = "User deactivated"
      redirect_to add_remove_student_path
    else
      student.update_attributes(active: true)
      flash[:success] = "User reactivated"
      redirect_to add_remove_student_path
    end
  end

  private

    def student_params
      params.require(:student).permit(:name, :active)
    end
end
