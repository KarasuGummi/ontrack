import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["question", "answer", "container", "userAnswer"];

  // flip() {
  //   this.questionTarget.classList.toggle("hidden");
  //   this.answerTarget.classList.toggle("hidden");
  // }

  flip() {
    // Ensure there's a user answer before flipping.
    if (this.userAnswerTarget.value.trim() === "") {
        alert("Please enter your answer first.");
        return;
    }

    const isShowingFront = this.containerTarget.style.transform !== "rotateY(180deg)";
    this.containerTarget.style.transform = isShowingFront ? "rotateY(180deg)" : "rotateY(0deg)";
  }

  flipBack() {
    this.containerTarget.style.transform = "rotateY(0deg";
  }
}
