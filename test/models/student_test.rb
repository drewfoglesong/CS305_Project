require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  
  def setup
  	@student = Student.new(name: "Abcd1234", active: true)
  end

  test "should be valid" do
    assert @student.valid?
  end

  test "name should be present" do
  	@student.name = ""
  	assert_not @student.valid?
  end

  test "name should not be too long" do
    @student.name = "a" * 9
    assert_not @student.valid?
  end

  test "student names should be unique" do
  	duplicate_student = @student.dup
  	@student.save
  	assert_not duplicate_student.valid?
  end
end
