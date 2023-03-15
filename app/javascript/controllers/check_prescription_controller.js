import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="check-prescription"
export default class extends Controller {

  static values = {
    category: String
    // Il récupère ma data-value du formulaire en en une catgéorie de type string
    // aucun rapport avec la category du treatment
    }

  connect() {
    console.log("check-prescription")
    // console.log(this.categoryValue) // syntaxe JS. Toutes les values se font appeler comme ça
    // console.log(this.element.value) // la valeur du label avec les logos

    // Si le nom du label (avec logo)
    if (this.element.value.toUpperCase().includes(this.categoryValue.toUpperCase())) {
      // this.element.checked = true // ça, ça ne faisait que selectionner en violet, mais moi j'avais mis de toggle d-none au CLICK
      // Paul dit qu'on peut SIMULER LE CLICK!
      this.element.click()
    }



  }
}
