import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {

  static targets = ["pills", "cares", "exercises"]

  connect() {
    console.log("test")
    // console.log(this.dropdownTarget)
  }

  reveal(event) {
    // ça fonctionne puisque j'ai reussi à afficher dans la console event.currentTarget
    // ça a l'air d'être ma dropdownTarget qu'il n'arrive pas à sélectionner

    console.log(event.currentTarget.value.includes("Pills"))
    // event.currentTarget.value === "🚴Exercises"

    if (event.currentTarget.value === "💊Pills") {
      this.pillsTarget.classList.remove("d-none")
      this.caresTarget.classList.add("d-none")
      this.exercisesTarget.classList.add("d-none")
    } else if (event.currentTarget.value === "❤️‍🩹Cares") {
      this.pillsTarget.classList.add("d-none")
      this.caresTarget.classList.remove("d-none")
      this.exercisesTarget.classList.add("d-none")
    } else if (event.currentTarget.value === "🚴Exercises"){
      this.pillsTarget.classList.add("d-none")
      this.caresTarget.classList.add("d-none")
      this.exercisesTarget.classList.remove("d-none")
    }

    //🚴Exercises
    // console.log(this.pillsTarget)
    // this.pillsTarget.classList.toggle("d-none")
    console.log("hello")
  }

}
