import $ from 'jquery';
import 'select2';
import 'select2/dist/css/select2.css';

document.addEventListener("DOMContentLoaded", () => {
  $('#station').select2({
    placeholder: 'Seleciona uma estação'
  });
})
