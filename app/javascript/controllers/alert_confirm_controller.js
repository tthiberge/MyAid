import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'


// Connects to data-controller="alert-confirm"
export default class extends Controller {
  connect() {
    Swal.fire({
      position: 'top-end',
      icon: 'success',
      title: 'I met my Doctor',
      showConfirmButton: false,
      timer: 2100
    })
  }
}
