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
    @user_interest = current_user.interests.sample.name # Store user interest for use in the view
    @subject = ""
    @learning_goal = ""
    @recommendations = generate_recommendations(@subject, @learning_goal, @user_interest)
  end


  def show
    @project = Project.find(params[:id])
    @buddy = current_user.buddy
  end

  def create
    @buddy = current_user.buddy
    @user = current_user
    @project = Project.new(project_params)
    project_subject = params[:project][:subject]
    project_learning_goal = params[:project][:learning_goal]
    user_interest = current_user.interests.sample.name

    # Call the method to generate recommendations
    @recommendations = generate_recommendations(project_subject, project_learning_goal, user_interest)

    if params[:add_project]
      selected_suggestion = @recommendations[params[:add_project].to_i]
      create_pending_project_from_suggestion(selected_suggestion)
    end

    render 'new'
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

  def generate_recommendations(subject, learning_goal, user_interest)
    prompt = <<~PROMPT
      Please suggest three project ideas for my #{subject} class.
      Please limit the words of the description for each project to less than 12 words.
      Please also limit the instructions to 3 - 5 steps max with each step having less than 12 words.
      The projects should be about #{learning_goal} and the projects should incorporate #{user_interest}.
      For each project idea, provide the following information:
      - Title
      - Description
      - Subject
      - Learning goal
      - Instructions
      - User interest
      - Vocabulary words
    PROMPT
    puts "Generated Prompt: #{prompt}"
    openai_service = OpenaiService.new(prompt)
    response = openai_service.call
    # puts "API Response: #{response}"

    suggestions = response["choices"][0]["message"]["content"]

    # Remove leading and trailing whitespace and split the suggestions by line breaks
    cleaned_suggestions = suggestions.strip.split("\n")
    structured_recommendations = { "suggested_projects" => cleaned_suggestions }
    structured_recommendations

    p structured_recommendations
  end

  def project_params
    params.require(:project).permit(:name, :deadline, :subject, :learning_goal, :status)
  end

  def create_pending_project_from_suggestion
    @project = Project.new(
      name: suggestion['title'],
      description: suggestion['description'],
      subject: suggestion['subject'],
      learning_goal: suggestion['learning_goal'],
      interest: suggestion['interest'],
      status: 'pending',
      user: current_user
    )
  end
end
