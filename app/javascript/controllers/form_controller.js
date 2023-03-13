import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {

  static target = ["dropdown", "formulaire"]

  connect() {
    console.log("test")
  }

  Reveal() {
    // ça fonctionne puisque j'ai reussi à afficher dans la console event.currentTarget
    // ça a l'air d'être ma dropdownTarget qu'il n'arrive pas à sélectionner
    console.log(this.formulaireTarget)
    this.formulaireTarget.classList.add("bk-success")
  }

}
