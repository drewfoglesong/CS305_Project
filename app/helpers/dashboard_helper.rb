module DashboardHelper
   def scorename(integer)
	student = Student.find_by(id:integer)
	return student.name
   end
end
