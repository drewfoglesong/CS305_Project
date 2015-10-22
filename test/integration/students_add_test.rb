require 'test_helper'

class StudentsAddTest < ActionDispatch::IntegrationTest
  
  test "Invalid StudentID" do 
    get add_remove_student_path
    assert_no_difference 'Student.count' do
    	post students_path, student: { name: "", active: false }
    end
    assert_template 'students/new'
  end
end
