import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["message"]

  connect(){
    setTimeout(() => {
      this.dismiss();
    }, 3000);
  }

  dismiss () {
    this.messageTarget.remove();
  }
}
