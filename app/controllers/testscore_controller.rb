class TestscoreController < ApplicationController
  def scores
    @student= Student.all
  end
end
