import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["partyDog"];

  connect() {
    console.log("loading-party-controller connected");
  }

  showModal(event) {
    console.log("showModal called");
    event.preventDefault();  // Prevent the form submission

    const modal = document.querySelector('.party-modal');
    if (modal) {
      modal.style.display = "block";
    }

    setTimeout(() => {
      this.element.closest('form').submit();
    }, 5000);
  }

}
