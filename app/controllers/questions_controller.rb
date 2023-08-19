class QuestionsController < ApplicationController
  def index
    message = params[:message]
    @response = OpenaiService.new(message).call
    @questions = Question.all
    @buddy = current_user.buddy
  end

  def show
    question = Question.find(params[:id])
    @answers = @question.answers
    # question = params[:question]
  end
end
