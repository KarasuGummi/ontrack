require 'json'

class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @buddy = current_user.buddy
    @projects = Project.all
    @accepted_projects = current_user.projects.accepted
  end

  def new
    @project = Project.new
    @buddy = current_user.buddy
  end


  def show
    @project = Project.find(params[:id])
    @buddy = current_user.buddy
    @project_greetings = [
      "Tell me more about this project!", "Do you have any snacks?", "Want to review your project?", "You are doing great!",
      "Have you done your project yet?", "Remember what you learned?",
      "What did you learn?"
    ]
  end

  def create
    # loading modal frame modal
    @buddy = current_user.buddy
    @user = current_user
    project_subject = params[:project][:subject]
    project_learning_goal = params[:project][:learning_goal]
    user_interest = current_user.interests.sample.name

    @recommendation = generate_recommendations(project_subject, project_learning_goal, user_interest)

    @project = Project.new(@recommendation)

    # @project.user = current_user

    if @project.save
      flash[:notice] = 'Project created!'
      if params[:add_project]
        project_to_accept = Project.find(params[:add_project])
        project_to_accept.update(status: 'accepted')
        flash[:notice] = 'Recommended project added!'
      end
      redirect_to project_path(@project)
    else
      puts "Project Errors: #{@project.errors}"
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

  def history
    @user = current_user
    @buddy = current_user.id
    @completed_projects = current_user.projects.completed
  end

  def project_params
    params.require(:project).permit(:name, :deadline, :subject, :learning_goal, :status, :description, :interest, :steps, :vocab_words)
  end

  def complete
    @project = Project.find(params[:id])
    @user = current_user

    if @project.completed?
      points_earned = 10
      @user.earn_points(points_earned)

      flash[:notice] = "Congratulations! You've earned #{points_earned} points."
    else
      flash[:alert] = "Project not completed yet."
    end

    redirect_to project_path(@project)
  end

  private

  def generate_recommendations(subject, learning_goal, user_interest)
    prompt = <<~PROMPT
      Please suggest one project for my class.
      Please limit the words of the description for the project to less than 12 words.
      Please also limit the instructions to 4 steps with each step having less than 12 words.
      The project should be about my learning and the project should incorporate my interest.
      There should only be 5 vocab words per project as strings in an array.
      For the project, provide the output as a JSON object with the following attributes:
      name: "name"
      description: "description"
      subject: #{subject}
      learning_goal: #{learning_goal}
      steps:
      1. step 1
      2. step 2
      3. step 3
      4. step 4
      user_interest: #{user_interest}
      vocab_words: [vocab words]

      I will provide the subject, learning_goal, and user_interest. Please provide the other attributes.
    PROMPT
    puts "Generated Prompt: #{prompt}"
    openai_service = OpenaiService.new(prompt)
    response = openai_service.call


    suggestion = response["choices"][0]["message"]["content"]
    # add an error if the response isn't what we wanted it to be -> try again
    suggestion = JSON.parse(suggestion)
    # Extracting the relevant sections of the suggestion
    # title = suggestion.match(/Title: "(.*?)"/)&.captures&.first
    # description = suggestion.match(/Description: "(.*?)"/)&.captures&.first
    # instructions = suggestion.scan(/^\d+\.\s(.*?)$/).flatten
    # user_interest = suggestion.match(/User interest: (.*?)$/)&.captures&.first
    # vocab_words = suggestion.match(/Vocabulary words: "(.*?)"/)&.captures&.first

    # default_info = {
    #   name: "Title not found",
    #   description: "Description not found",
    #   subject: subject,
    #   learning_goal: learning_goal,
    #   interest: user_interest,
    #   steps: "Steps not found",
    #   vocab_words: "Vocab words not found",
    # }

    project_info = {
      name: suggestion["name"].empty? ? "Title not found" : suggestion["name"],
      description: suggestion["description"].empty? ? "Description not found" : suggestion["description"],
      subject: suggestion["subject"].empty? ? subject : suggestion["subject"],
      learning_goal: suggestion["learning_goal"].empty? ? learning_goal : suggestion["learning_goal"],
      interest: suggestion["user_interest"].empty? ? user_interest : suggestion["user_interest"],
      steps: suggestion["steps"].empty? ? "Steps not found" : suggestion["steps"],
      vocab_words: suggestion["vocab_words"].empty? ? ["Vocab words not found"] : suggestion["vocab_words"],
      status: 'pending',
      user: current_user
    }

    # project_info = {
    #   status: 'pending',
    #   user: current_user
    # }

    # suggestion.each do |key, value|
    #   project_info[key] = value.empty? ? default_info[key] : value
    # end

    project_info
  end



end
