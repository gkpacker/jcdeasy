import "bootstrap";
import "components/slide";
import "components/confirm";
import "plugins/flatpickr";
import "plugins/inputmask";
import "components/select2";
import "components/scroll-text.js";
import "components/disabling.js";
import swal from 'sweetalert';
import { initUpdateNavbarOnScroll } from '../components/navbar';
if (document.querySelector('.navbar-wagon')) {
  initUpdateNavbarOnScroll();
}
