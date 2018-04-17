import swal from 'sweetalert2';
import "bootstrap";
import "components/slide";
import "components/confirm";
import "plugins/flatpickr";
import "plugins/inputmask";
import "components/select2";
import "components/scroll-text.js";
import "components/disabling.js";
import { initUpdateNavbarOnScroll } from '../components/navbar';
if (document.querySelector('.navbar-wagon')) {
  initUpdateNavbarOnScroll();
}
