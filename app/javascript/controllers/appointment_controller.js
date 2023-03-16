import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="appointment"
export default class extends Controller {

  static targets = ["morning", "afternoon", "form"]

  connect() {
    // console.log("Je suis dans appointment controller")
  }

  revealAMPM(event) {
    // console.log(event.currentTarget.value)
    if (event.currentTarget.value === "AM") {
      // console.log("je suis dans AM")
      this.morningTarget.classList.remove("d-none")
      this.afternoonTarget.classList.add("d-none")
    } else if (event.currentTarget.value === "PM") {
      // console.log("Je suis dans PM")
      this.morningTarget.classList.add("d-none")
      this.afternoonTarget.classList.remove("d-none")
    }
  }

  typeComment() {
    console.log("je suis dans linput") // Vérifier ma data-action

    // console.log(this.formTarget) // Vérifier que je récupère ma data-target

    this.formTarget.scrollTo(0, this.formTarget.scrollHeight)

    console.log("bas de page") // Vérifier si on a réussi à atteindre cette ligne donc que la ligne de scroll s'est bien exécutée
  }


}
