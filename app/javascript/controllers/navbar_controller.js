import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
    console.log("coucou")
  }

  updateNavbar() {
    console.log(window.scrollY)
    if (window.scrollY <= 0) {
      this.element.classList.remove("navbar-features-disapear")
    } else {
      this.element.classList.add("navbar-features-disapear")
    }
  }
}
