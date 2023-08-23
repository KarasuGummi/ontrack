class QuestionsController < ApplicationController
  before_action :set_project

  def index
    @questions = @project.questions
    @buddy = current_user.buddy

    unless session[:awarded_points_for_questions]
      random_points = rand(5..10)
      current_user.earn_points(random_points)

      flash[:notice] = "Here's #{random_points} points. Now go on and do your best!"
      session[:awarded_points_for_questions] = true
    end
  end

  # def show
  #   question = Question.find(params[:id])
  #   @answers = @question.answers
  #   # question = params[:question]
  # end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end
end
