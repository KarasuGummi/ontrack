import { Controller } from "@hotwired/stimulus"
import party from 'party-js';

// Connects to data-controller="party-confetti"
export default class extends Controller {
  static targets = ['love']
  connect() {
    // console.log('Am I working?')
    const cake = this.loveTarget
    // console.log(this.loveTarget.innerText)

    if (parseInt(this.loveTarget.innerText, 10) >= 1) {
      party.confetti(cake, {
        count: 50,
        spread: 40
      });
      party.confetti(cake, {
        count: 50,
        spread: 40,
        shapes: ["star"]
      });
      party.sparkles(cake, {
      });
    }
  }
}
