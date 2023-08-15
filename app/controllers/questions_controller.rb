class QuestionsController < ApplicationController
  def index
    message = params[:message]
    @response = OpenaiService.new(message).call
    @questions = Question.all
  end

  def show
    question = Question.find(params[:id])
    @answers = @question.answers
    # question = params[:question]
    openai_service = OpenaiService.new(question)
    @response = openai_service.call

    # @user_input = params[:user_input]
    # if @user_input.present?
    #   openai_service = OpenaiService.new(@user_input)
    #   @response = openai_service.call
    # end
  end
end
