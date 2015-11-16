class GamesController < ApplicationController
before_action :logged_in_teacher
layout 'application', :except => [:chapter_four]

def chapter_four
   @in_game = true;
end

def student_select
end


private
  def logged_in_teacher
      unless logged_in?
        flash[:danger] = "Nice try"
        redirect_to login_url
      end
    end
end
