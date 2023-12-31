require "openai"

class OpenaiService
  attr_reader :client, :prompt

  def initialize(prompt)
    @client = OpenAI::Client.new
    @prompt = prompt
  end

  def call
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: [{ role: "user", content: prompt }], # Required.
        temperature: 0.7,
        stream: false,
        max_tokens: 500 # might want to check this
      }
    )
    puts "API Response: #{response.inspect}"
    # you might want to inspect the response and see what the api is giving you
    # return response["choices"][0]["message"]["content"]
    return response
  end
end
