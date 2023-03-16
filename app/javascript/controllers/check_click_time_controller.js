import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="check-click-time"
export default class extends Controller {

  static targets = ["dayHalf", "morningHour", "afternoonHour"]

  static values = {
    dayhalf: String,
    isPersisted: String,
    hourPrescription: String
  }

  connect() {
    if (this.isPersistedValue !== "false") {
      console.log('controller check click time')
      // console.log(this.dayhalfValue) // La valeur que j'ai passée dans le controller comme étant le day_half de l'instance de prescription
      // this.dayHalfTarget.value (la PREMIERE des values du DOM pour ces inputs)

      // Si les deux values ci-dessous sont égales, this.dayHalfTarget.click()

      this.dayHalfTargets.forEach((target) => {
        // Pour cliquer sur AM ou PM
        if (target.value == this.dayhalfValue) {
          target.click()
      }

        // RETOUR EXPERIENCE sur les pbs que j'ai eus
        // console.log("AM"=="AM")
        // console.log(target.value)
        // console.log(this.dayhalfValue)
        // console.log(target.value==this.dayhalfValue)
        // console.log(target.value=="AM") // ça ça marche (ok pour un des deux)
        // console.log(this.dayhalfValue=="AM") // mais ça ça marche pas alors que devrait marcher pour les deux!!!!
        // // Problème avec dayhalfValue alors que ça affiche string AM... Je comprends pas. Dans ma définition de la data-value dans la div du controller, il y avait des espaces en trop que je ne voyais pas dans la console du browser!!

      })

        // console.log(this.morningHourTargets) // OK - c'est un objet

        // Pour sélectionner l'heure spécifique
        if (this.dayhalfValue == "AM") {
          this.morningHourTargets.forEach((target) => {
              if (target.value == this.hourPrescriptionValue)
              target.click()
        })} else {
          this.afternoonHourTargets.forEach((target) => {
            if (target.value == this.hourPrescriptionValue)
            target.click()
            })
          }
        }
    }
  }
