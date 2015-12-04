module DashboardHelper

def mostRecentScore(student_id)
   @score = Score.all
   value = "NOT TAKEN"
   
   @score.each do |score|
      if score.student_id == student_id
	    value = score.entry
	  end
   end
   
   return value
   
end

def scorename(integer)
	student = Student.find_by(id:integer)
	return student.name
   end
end
