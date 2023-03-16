import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {

  static targets = ["pills", "cares", "exercises", "morning", "afternoon"]


  reveal(event) {
    // console.log(event.currentTarget.value.includes("Pills"))


    if (event.currentTarget.value === "💊Pills") {
      this.pillsTarget.classList.toggle("d-none")
      this.caresTarget.classList.add("d-none")
      this.exercisesTarget.classList.add("d-none")
    } else if (event.currentTarget.value === "❤️‍🩹Cares") {
      this.pillsTarget.classList.add("d-none")
      this.caresTarget.classList.toggle("d-none")
      this.exercisesTarget.classList.add("d-none")
    } else if (event.currentTarget.value === "🚴Exercises"){
      this.pillsTarget.classList.add("d-none")
      this.caresTarget.classList.add("d-none")
      this.exercisesTarget.classList.toggle("d-none")
    }

    // console.log("hello")
  }

  revealAMPM(event) {
    // console.log(event.currentTarget.value)
    if (event.currentTarget.value === "AM") {
      // console.log("je suis dans form AM")
      this.morningTarget.classList.remove("d-none")
      this.afternoonTarget.classList.add("d-none")
    } else if (event.currentTarget.value === "PM") {
      // console.log("Je suis dans form PM")
      this.morningTarget.classList.add("d-none")
      this.afternoonTarget.classList.remove("d-none")
    }
  }

}
