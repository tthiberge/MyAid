import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

// Connects to data-controller="alertbysweet"
export default class extends Controller {
  connect() {
    console.log('connected')
  }

  confirm(event) {
    event.preventDefault()
    console.log('test 12 ')
    Swal.fire({
      title: 'Error!',
      text: 'Do you want to continue',
      icon: 'error',
      showConfirmButton: true,
      showDenyButton: true

    }) .then((confirm)=>{
      if (confirm.isConfirmed ==true){
        console.log("agreed")
        this.element.requestSubmit()
      } else {
        console.log("Not agreed")
      }





    }

    )


  }


}
