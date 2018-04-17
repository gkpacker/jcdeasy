import swal from 'sweetalert2';
import "bootstrap";
import "components/slide";
import "plugins/flatpickr";
import "components/confirm";
import "plugins/inputmask";
import "components/select2";
import "components/scroll-text.js";
import { initUpdateNavbarOnScroll } from '../components/navbar';
if (document.querySelector('.navbar-wagon')) {
  initUpdateNavbarOnScroll();
}
