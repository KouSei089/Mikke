class TriviaController < ApplicationController
  def index
    @trivia = Trivia.all
    @evidence = Evidence.all
  end

  def show
    @trivia = Trivia.find(rand(Trivia.first.id..Trivia.last.id))
  end
end
