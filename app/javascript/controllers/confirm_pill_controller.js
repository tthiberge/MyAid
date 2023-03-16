import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

// Connects to data-controller="confirm-pill"
export default class extends Controller {
  connect() {

    Swal.fire({
      position: 'top-end',
      icon: 'success',
      title: 'Great! You took your pills!',
      showConfirmButton: false,
      timer: 2500
    })
  }

}
