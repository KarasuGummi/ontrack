class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @buddy = current_user.buddy
    @projects = Project.all
    # I added this line so that we can display only projects that have been accepted
    @accepted_projects = current_user.projects.accepted
  end

  def new
    @project = Project.new
    @buddy = current_user.buddy
  end

  def show
    @project = Project.find(params[:id])
    @buddy = current_user.buddy
  end

  def create
    @buddy = current_user.buddy
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, status: :see_other
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to projects_path, notice: 'This project was updated successfully!'
    else
      render 'show'
    end
  end

  def dashboard
    @user = current_user
    @buddy = current_user.id
    @latest_project = current_user.projects.accepted.order(created_at: :desc).first
    @upcoming_projects = current_user.projects.accepted.where('deadline > ?', DateTime.now)
    @user_points = current_user.projects.sum(:points)
    @greetings = [
      "Hi there!", "Do you have any snacks?", "Want to try a new project?", "What are you learning these days?",
      "I'm so glad to see you!", "Finish your project and get me some snacks!", "Don't be afraid to make mistakes.",
      "I want to dance with somebody."
    ]
    user_interest_names = current_user.interests.map(&:name)
    @recommended_projects = current_user.projects.pending.where(
      subject: @user.subject,
      interest: user_interest_names,
      learning_goal: @user.learning_goal
    )
  end

  private

  def project_params
    params.require(:project).permit(:name, :deadline, :subject, :learning_goal, :status)
  end
end
