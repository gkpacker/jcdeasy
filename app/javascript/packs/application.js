import "bootstrap";
import "components/slide";
import "components/confirm";
import "plugins/flatpickr";
import "plugins/inputmask";
import "components/select2";
import "components/scroll-text.js";
import { bindDisableForm } from "components/disabling.js";
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
  paramName: "art", // The name that will be used to transfer the art
  maxFilesize: 2, // MB
  maxFiles: 1, // MB
  addRemoveLinks: true,
  accept: function(art, done) {
    if (art.name == "justinbieber.jpg") {
      done("Naha, you don't.");
    }
    else {
      done()
       }
    }
  }
}
