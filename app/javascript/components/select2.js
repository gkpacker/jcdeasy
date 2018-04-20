import $ from 'jquery';
import 'select2';
import 'select2/dist/css/select2.css';

document.addEventListener("DOMContentLoaded", () => {
  $('#select2').select2({
    tags: true,
    placeholder: 'Seleciona uma estação'
  });

  $('#select2-mobile').select2({
    tags: true,
    placeholder: 'Seleciona uma estação'
  });

  $('#select2-mobile2').select2({
    tags: true,
    placeholder: 'Seleciona uma estação'
  });
})
