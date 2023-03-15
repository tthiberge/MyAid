import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

// Connects to data-controller="confirm-pill"
export default class extends Controller {
  connect() {

    Swal.fire({
      position: 'top-end',
      icon: 'success',
      title: 'Great! you took the pills',
      showConfirmButton: false,
      timer: 2500
    })
  }

}
