import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["question", "answer"];

  flip() {
    this.questionTarget.classList.toggle("hidden");
    this.answerTarget.classList.toggle("hidden");
  }
}
