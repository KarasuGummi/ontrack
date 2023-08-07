class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all
    # I added this line so that we can display only projects that have been accepted
    @accepted_projects = current_user.projects.accepted
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
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
      redirect_to dashboard_path, notice: 'This project was updated successfully!'
    else
      render 'show'
    end
  end

  def dashboard
    @buddy = current_user.id
    @latest_project = current_user.projects.accepted.order(created_at: :desc).first
    @upcoming_projects = current_user.projects.accepted.where('deadline > ?', DateTime.now)
    @user_points = current_user.projects.sum(:points)
    @recommended_projects = current_user.projects.pending.where(category: current_user.interest)
  end

  private

  def project_params
    params.require(:project).permit(:name, :deadline, :category, :status)
  end
end
