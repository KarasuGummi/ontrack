class QuestionsController < ApplicationController
  before_action :set_project

  def index
    message = params[:message]
    @response = OpenaiService.new(message).call
    @questions = @project.questions
    @buddy = current_user.buddy
  end

  def show
    question = Question.find(params[:id])
    @answers = @question.answers
    # question = params[:question]
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end
end
