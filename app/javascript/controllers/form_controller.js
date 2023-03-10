import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {

  static target = ["dropdown"]

  connect() {
    console.log("test")
  }
}
