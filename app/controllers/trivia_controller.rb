class TriviaController < ApplicationController
  def show
    @trivia = Trivia.find(rand(Trivia.first.id..Trivia.last.id))
  end
end
