import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="buddyimg"
export default class extends Controller {
//   static targets = ["dogImage"];
//   static values = { currentPattern: Number };

//   connect() {
//     this.currentPattern = 1;
//     this.togglePattern();
//     console.log("dogImageTargets:", this.dogImageTargets);
//   }

//   togglePattern() {
//     console.log("dogImageTargets:", this.dogImageTargets);
//     // Rest of your code...
//     this.currentPattern = this.currentPattern === 1 ? 2 : 1;

//     // Move the following lines inside the togglePattern method
//     const sleepingBuddy = this.dogImageTargets.find(target => target.classList.contains("sleeping-buddy"));
//     const awakeBuddy = this.dogImageTargets.find(target => target.classList.contains("awake-buddy"));

//     if (this.currentPattern === 1) {
//       sleepingBuddy.classList.remove("hidden");
//       awakeBuddy.classList.add("hidden");
//     } else {
//       sleepingBuddy.classList.add("hidden");
//       awakeBuddy.classList.remove("hidden");
//     }

//     setTimeout(this.togglePattern.bind(this), 500);
//   }
// }

var spriteWidth = 400;
var steps = 2;

// When the animation starts, we need to know
// the current step (or image) and position the
// sprite accordingly.

var currentStep = 0;
var currentPos = 0;
var speed = 100;

function animate() {
  currentStep = (currentStep + 1) % steps;
  currentPos = (-currentStep * spriteWidth) + 'px';
  document.querySelector('.animation').style.backgroundPosition = currentPos + ' top';
}

setInterval(animate, speed);
}
