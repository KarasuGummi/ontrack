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
    @buddy = current_user.buddy
    @user = current_user
    project_subject = params[:project][:subject]
    project_learning_goal = params[:project][:learning_goal]
    user_interest = current_user.interests.sample.name

    # @recommendation = generate_recommendations(project_subject, project_learning_goal, user_interest)
    # @project = Project.new(@recommendation)
    # @project.user = current_user

    suggestion = generate_recommendations(project_subject, project_learning_goal, user_interest)

    @project = Project.new(
      name: suggestion["name"].empty? ? "Title not found" : suggestion["name"],
      description: suggestion["description"].empty? ? "Description not found" : suggestion["description"],
      subject: suggestion["subject"].empty? ? subject : suggestion["subject"],
      learning_goal: suggestion["learning_goal"].empty? ? learning_goal : suggestion["learning_goal"],
      interest: suggestion["user_interest"].empty? ? user_interest : suggestion["user_interest"],
      steps: suggestion["steps"].empty? ? "Steps not found" : suggestion["steps"],
      vocab_words: suggestion["vocab_words"].empty? ? ["Vocab words not found"] : suggestion["vocab_words"],
      status: 'pending',
      user: current_user
    )

    if @project.save
      suggestion["questions"].each do |q|
        question = Question.create(question_content: q["question_content"], project: @project)
        Answer.create(answer_content: q["answer_content"], question: question)
      end

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
    @project = Project.new
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
      I'm seeking a project recommendation for my class. The project should uniquely intertwine the student's interest (user_interest), the subject they're studying (subject), and the specific learning goal (learning_goal) they are targeting.

      Specific guidelines:
      1. The description should be concise, not exceeding 30 words.
      2. The instructions for the project should be broken down into 4 distinct steps, each within 16 words.
      3. Both the user_interest and learning_goal MUST be explicitly mentioned in the project's name or description.
      4. Vocabulary is essential; hence, suggest 5 vocabulary words relevant to the project.
      5. Develop five questions about the project. These questions should either reference a vocabulary word or a specific step in the project. Each question should have a corresponding answer.

      Format the output as a JSON object with these attributes and this format. Subject, learning_goal, and user_interest are already provided:
      "name": "name",
      "description": "description",
      "subject": #{subject},
      "learning_goal": #{learning_goal},
      "steps": ["step 1", "step 2", "step 3", "step 4"],
      "user_interest": #{user_interest},
      "vocab_words": ["vocab word 1", "vocab word 2", "vocab word 3", "vocab word 4", "vocab word 5"],
      "questions": [
        { "question_content": "question 1", "answer_content": "answer 1" },
        { "question_content": "question 2", "answer_content": "answer 2" },
        { "question_content": "question 3", "answer_content": "answer 3" },
        { "question_content": "question 4", "answer_content": "answer 4" },
        { "question_content": "question 5", "answer_content": "answer 5" }
      ]
    PROMPT
    puts "Generated Prompt: #{prompt}"
    openai_service = OpenaiService.new(prompt)
    response = openai_service.call


    suggestion = response["choices"][0]["message"]["content"]
    # add an error if the response isn't what we wanted it to be -> try again
    begin
      suggestion = JSON.parse(suggestion)
    rescue JSON::ParserError
      render :new, notice: "try again"
    end

    p suggestion

    # project_info = {
    #   name: suggestion["name"].empty? ? "Title not found" : suggestion["name"],
    #   description: suggestion["description"].empty? ? "Description not found" : suggestion["description"],
    #   subject: suggestion["subject"].empty? ? subject : suggestion["subject"],
    #   learning_goal: suggestion["learning_goal"].empty? ? learning_goal : suggestion["learning_goal"],
    #   interest: suggestion["user_interest"].empty? ? user_interest : suggestion["user_interest"],
    #   steps: suggestion["steps"].empty? ? "Steps not found" : suggestion["steps"],
    #   vocab_words: suggestion["vocab_words"].empty? ? ["Vocab words not found"] : suggestion["vocab_words"],
    #   status: 'pending',
    #   user: current_user
    # }
    # # project_info
    return suggestion
  end
end
