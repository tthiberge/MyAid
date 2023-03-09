import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="init-tom-select"
export default class extends Controller {

  connect() {
    this.initTomSelect()
  }

  initTomSelect() {
    const optionValues = this.element.parentElement.querySelector(".tom-select-options")
    var options =  {
      sortField: {
      field: "text",
      direction: "asc",
      placeholder:"I am some placeholder !",
      },
    plugins: ['remove_button'],
    render:{
      option_create: function( data, escape ){
        return '<div class="create">Ajouter <strong>' + escape(data.input) + '</strong>&hellip;</div>';
      },
      no_results: function( data, escape ){
        return '<div class="no-results">Aucun résultat trouvé</div>';
      },
    }
    }
    if (optionValues) {
      options["options"] = JSON.parse(optionValues.innerText)
    }
    if (this.element.dataset.create == 'true') {
      options["create"] = true
    } else {
      options["create"] = false
    }
    new TomSelect( `#${this.element.id}`,options);
  }
}
