class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message.chatroom = @chatroom
    @message.user = current_user

    if @message.save
      chatbot_response = generate_chatbot_response(@message.content)

      # Create and save the chatbot's response message
      chatbot_message = Message.new(content: chatbot_response, user: current_user.buddy.user)
      chatbot_message.chatroom = @chatroom
      chatbot_message.save

      redirect_to chatroom_path(@chatroom)
    else
      render 'chatrooms/show', status: :unprocessable_entity
    end
    # if @message.save
    #   chatbot_response = generate_chatbot_response(@message.content)
    #   puts "Chatbot Response Before Saving: #{chatbot_response}"

    #   @chatroom.messages.create(content: chatbot_response, user: current_user)
    #   # @chatroom.update(last_activity_at: Time.now)
    #   chatbot_message = Message.new(content: chatbot_response, user: current_user.buddy.user)
    #   chatbot_message.chatroom = @chatroom
    #   chatbot_message.save

    #   redirect_to chatroom_path(@chatroom)
    # else
    #   render 'chatrooms/show', status: :unprocessable_entity
    # end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def generate_chatbot_response(user_message)
    personality = current_user.buddy.personality
    age = current_user.age
    grade = current_user.grade
    buddy_name = current_user.buddy.name

    prompt = <<~PROMPT
      Your name is #{buddy_name}.
      Assume the role of a person with a #{personality} personality.
      You are talking to a #{age} year old #{grade}.
      Answer this student's question: #{user_message}.
      Please keep the response within 50 words.
    PROMPT

    openai_service = OpenaiService.new(prompt)
    chatbot_response = openai_service.call
    puts "Chatbot Response: #{chatbot_response}"

    response_content = chatbot_response['choices'][0]['message']['content']
    @chatbot_response_content = response_content

    buddy_user = current_user.buddy
    puts "Buddy User: #{buddy_user.inspect}"

    puts "Response Content: #{response_content}"
    chatbot_message = Message.new(content: @chatbot_response_content, user: current_user, chatroom: @chatroom, is_bot: true)
    if chatbot_message.save
      @chatbot_response_content # Return the chatbot response content
    else
      Rails.logger.error("Chatbot Message Not Saved: #{chatbot_message.errors.full_messages}")
      nil  # Return an empty string or handle the error appropriately
    end
  end
end
