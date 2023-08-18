import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dogImage"];

  connect() {
    this.toggleDogImage();
  }
  toggleDogImage() {
    setInterval(() => {
      if (this.dogImageTarget.getAttribute("src") === "/path/to/first/image.png") {
        this.dogImageTarget.setAttribute("src", "/path/to/second/image.png");
      } else {
        this.dogImageTarget.setAttribute("src", "/path/to/first/image.png");
      }
    }, 500);
  }
}
