import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="load-image"
export default class extends Controller {
  static targets = ["image"]
  connect() {
    console.log('hello')
  }

  displayImage(event) {
    const reader = new FileReader()
    reader.onload = (event) => {
      this.imageTarget.src = event.currentTarget.result
    }
    reader.readAsDataURL(event.currentTarget.files[0])
  }
}
