import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"
import { turboStream } from "@hotwired/turbo-rails"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      {
        received: data => this.handleReceivedData(data)
      }
    )

    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  handleReceivedData(data) {
    // Assuming the data contains the new message HTML fragment
    // You might need to adjust this based on how your data is structured
    turboStream.append(data, this.messagesTarget)
  }
}
