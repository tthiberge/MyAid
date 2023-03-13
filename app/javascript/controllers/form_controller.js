import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {

  static targets = ["dropdown", "formulaire"]

  connect() {
    console.log("test")
    console.log(this.dropdownTarget)
  }

  reveal() {
    // ça fonctionne puisque j'ai reussi à afficher dans la console event.currentTarget
    // ça a l'air d'être ma dropdownTarget qu'il n'arrive pas à sélectionner
    console.log(this.dropdownTarget)
    this.dropdownTarget.classList.remove("d-none")
    console.log("hello")
  }

}
