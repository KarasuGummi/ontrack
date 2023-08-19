class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    # chat
  end

  def chat
    personality = current_user.buddy.personality
    age = current_user.age
    grade = current_user.grade
    buddy_name = current_user.buddy.name

    prompt = <<~PROMPT
      Your name is #{buddy_name}.
      Assume the role of a person with a #{personality} personality.
      You are talking to a #{age} year old #{grade}.
      Start by greeting them in a way that is appropriate for this type of person.
    PROMPT
    puts "Generated Prompt: #{prompt}"
    openai_service = OpenaiService.new(prompt)
    response = openai_service.call
    @buddychat = response["choices"][0]["message"]["content"]
  end
end

# kevin = User.create!(
#   username: 'italian_beyonce',
#   email: 'kevin@ontrack.com',
#   password: 'buddy000',
#   subject: 'Architecture',
#   buddy: kevin_buddy,
#   grade: 'College Junior',
#   learning_goal: 'basic vocabulary',
#   age: 21,
#   points: 10
# )
