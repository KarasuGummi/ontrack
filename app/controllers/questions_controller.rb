class QuestionsController < ApplicationController
  def index
    message = params[:message]
    @response = OpenaiService.new(message).call
  end

  def show
    question = params[:question]
    openai_service = OpenaiService.new(question)
    @response = openai_service.call

    # @user_input = params[:user_input]
    # if @user_input.present?
    #   openai_service = OpenaiService.new(@user_input)
    #   @response = openai_service.call
    # end
  end
end
