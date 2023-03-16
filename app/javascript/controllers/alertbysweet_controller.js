import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

// Connects to data-controller="alertbysweet"
export default class extends Controller {
  connect() {
    console.log('delete button')
  }

  confirm(event) {
    event.preventDefault()
    Swal.fire({
      title: 'Are you sure?',
      text: "Don't you want to see the doctor?",
      icon: 'error',
      cancelButtonColor: "#0066CC",
      confirmButtonColor: "#04E25D",
      showConfirmButton: true,
      showDenyButton: true,

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
