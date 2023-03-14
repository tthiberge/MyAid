import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {

  static targets = ["pills", "cares", "exercises"]


  reveal(event) {
    console.log(event.currentTarget.value.includes("Pills"))


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

    console.log("hello")
  }



}
