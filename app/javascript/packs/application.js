import "bootstrap";
import "components/slide";
import "components/modal";
import "components/confirm";
import "plugins/flatpickr";
import "plugins/inputmask";
import "components/select2";
import "components/scroll-text.js";
import { bindDisableForm } from "components/disabling.js";
if (document.getElementById("order_duration")) {
  import("components/total-price.js")
}
import swal from 'sweetalert';
import { initUpdateNavbarOnScroll } from '../components/navbar';
if (document.querySelector('.navbar-wagon')) {
  initUpdateNavbarOnScroll();
}
if (document.getElementById('add-panel')) {
  bindDisableForm()
}
if (document.querySelector(".dropzone")) {
  Dropzone.options.artUpload = {
  dictDefaultMessage: "Arraste sua arte para fazer o upload",
  paramName: "art", // The name that will be used to transfer the art
  maxFilesize: 2, // MB
  maxFiles: 1, // MB
  addRemoveLinks: true,
  init: function() {
      this.on("complete", function(file) {
        const currentElement = this.element.parentElement;
        const imageElement = currentElement.querySelectorAll("img")[1];
        const pendent = currentElement.querySelector("#pendent")
        const send = currentElement.querySelector("#art-status")
        if (imageElement) {
          imageElement.remove()
        } else if (pendent) {
          pendent.remove()
        } else {
          send.remove()
        }
        currentElement.insertAdjacentHTML('beforeend', `<img class="dropzone-art" src="${this.files[0].dataURL}" alt="${this.files[0].name}" width="230">`)
        currentElement.insertAdjacentHTML('beforeend', `<p id="art-status" class="text-center">Aguardando aprovação</p>`)
        this.element.remove()
        const a = () => {
          currentElement.querySelector("#art-status").remove()
        }
        const b = () => {
          currentElement.insertAdjacentHTML('beforeend', `<p id="art-status">Arte aprovada</p>`)
        }
        setInterval(a, 5000)
        setInterval(b, 5000)
      })
    }
  }
}
