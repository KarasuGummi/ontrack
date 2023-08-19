import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dogImage"];

  showModal(event) {
    event.preventDefault();
    const modal = document.querySelector('.modal');
    if (modal) {
      modal.style.display = "block";
    }

    setTimeout(() => {
      this.element.submit();
    }, 500);
  }
}
