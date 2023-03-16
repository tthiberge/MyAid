import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

// Connects to data-controller="alert-exercise"
export default class extends Controller {
  connect() {
    console.log('alert-exercise')
    Swal.fire({
      position: 'top-end',
      confirmButtonColor: "#04E25D",
      icon: 'success',
      title: "Wow ! You've exercised ! Congrats!",
      showConfirmButton: false,
      timer: 2100
    })
  }
}
