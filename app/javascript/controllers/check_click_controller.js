import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="check-click"
export default class extends Controller {

  static values = {
    category: String,
    isPersisted: String,
    hour: String,
    dayHalf: String
    // Il récupère ma data-value du formulaire en un type string
    // aucun rapport avec la category du treatment
    }

  connect() {
    // console.log("check-click")
    // console.log(this.isPersistedValue) // Vérifier qu'on passe la value isPersisted du formulaire au controller


    if (this.isPersistedValue !== "false") {

      // console.log(this.categoryValue) // syntaxe JS. Toutes les values se font appeler comme ça. La valeur qu'on a passé dans le formulaire
      // console.log(this.element.value) // la valeur value dans le DOM de l'élément qui porte le controller

      if (this.element.value.toUpperCase().includes(this.categoryValue.toUpperCase())) {
        this.element.checked = true // ça, ça ne faisait que selectionner en violet, mais moi j'avais mis de toggle d-none au CLICK
        // Paul dit qu'on peut SIMULER LE CLICK!
        this.element.click()
      }

      // Que pour les heures ce ne soit pas un include mais un egal
      // if (this.element.value === this.hourValue) {
      //   if (this.dayHalfValue === "AM") {
      //     console.log(this.element.value)
      //     console.log ("heures égales morning")
      //     console.log(this.hourValue)
      //     this.element.click()
      //   } else {
      //     console.log(this.element.value)
      //     console.log ("heures égales afternoon")
      //     console.log(this.hourValue)
      //     this.element.click()
      //   }
      // }



    }


  }
}
