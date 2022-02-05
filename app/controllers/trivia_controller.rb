class TriviaController < ApplicationController
  def index
    @trivia = Trivia.all
    @trivia_philosophy = Trivia.all
  end

  def show
    @trivia = Trivia.find(rand(Trivia.first.id..Trivia.last.id))
  end
end
