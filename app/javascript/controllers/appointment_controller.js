import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="appointment"
export default class extends Controller {

  static targets = ["morning", "afternoon"]

  connect() {
    console.log("appointment")
  }

  reveal(event) {
    console.log(event.currentTarget.value)
    if (event.currentTarget.value === "AM") {
      console.log("je suis dans AM")
      this.morningTarget.classList.remove("d-none")
      this.afternoonTarget.classList.add("d-none")
    } else if (event.currentTarget.value === "PM") {
      console.log("Je suis dans PM")
      this.morningTarget.classList.add("d-none")
      this.afternoonTarget.classList.remove("d-none")
    }
  }
}
