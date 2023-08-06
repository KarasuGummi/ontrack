class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all
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

  def dashboard
    @latest_project = current_user.projects.order(created_at: :desc).first
    @upcoming_projects = current_user.projects.where('deadline > ?', DateTime.now)
    @user_points = current_user.projects.sum(:points)
    @recommended_projects = Project.where(category: current_user.interest)
  end

  private

  def project_params
    params.require(:project).permit(:name, :deadline, :category)
  end
end
