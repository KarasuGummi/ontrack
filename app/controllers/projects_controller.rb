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
    # @recommended_projects = Project.where(category: current_user.interest)
    # @project = Project.find(current_user.project_id)
    # I think we can use this line below to access the buddy's name, love, etc.
    # @buddy = current_user.buddy
    # Not so sure how we will do this right now.
    # @progress =
  end
  private

  def project_params
    params.require(:project).permit(:name, :deadline, :category)
  end
end
