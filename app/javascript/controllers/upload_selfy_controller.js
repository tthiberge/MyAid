import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="upload-selfy"
export default class extends Controller {
   static targets = ["input", "form", "button"]

  connect() {
    console.log(this.inputTarget)
  }

  upload() {
    this.inputTarget.click()
  }
  // data-target sur l'input où on clique pour rajouter l'image et un data-target sur le bouton que je viens de créer
  // input du formulaire, on veut qu'il ne se voit pas > d-none
  // action au clic sur le bouton que j'ai créé > il doit me proposer d'upload une image comme l'input que j'ai caché
  // s'assurer que le selfie a bien été créé et uploadé

}
