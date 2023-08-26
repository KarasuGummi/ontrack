import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["question", "answer", "container", "userAnswer"];

  flip() {
    // Ensure there's a user answer before flipping.
    if (this.userAnswerTarget.value.trim() === "") {
        alert("Please enter your answer first.");
        return;
    }

    // Display the user's answer on the back side.
    const answerParagraph = this.answerTarget.querySelector(".answer");
    answerParagraph.textContent = this.userAnswerTarget.value;

    // Flip the card.
    this.containerTarget.style.transform = "rotateY(180deg)";
  }

  flipBack() {
    this.containerTarget.style.transform = "rotateY(0deg)";
  }
}
