import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dogImage"];

  connect() {
    this.toggleDogImage();
  }
  toggleDogImage() {
    setInterval(() => {
      const currentImage = this.dogImageTarget.querySelector('img').getAttribute("src");
      const firstImage = 'https://res.cloudinary.com/du53mgiot/image/upload/v1691390417/gsv9qtfodjbhccbmhwws.png';
      const secondImage = 'https://res.cloudinary.com/du53mgiot/image/upload/v1691390436/qifldk91fout1jdwru7r.png';

      if (currentImage === firstImage) {
        this.dogImageTarget.innerHTML = `<img src="${secondImage}" alt="Animated Dog" height="140" style="crop: fill;">`;
      } else {
        this.dogImageTarget.innerHTML = `<img src="${firstImage}" alt="Animated Dog" height="140" style="crop: fill;">`;
      }
    }, 500);
  }
}
