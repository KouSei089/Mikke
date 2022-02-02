class TutorialsController < ApplicationController
  def show
    @trivia = Trivia.all
  end
end
