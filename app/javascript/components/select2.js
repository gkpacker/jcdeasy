import $ from 'jquery';
import 'select2';
import 'select2/dist/css/select2.css';

document.addEventListener("DOMContentLoaded", () => {
  $('.select2').select2({
    tags: true,
    placeholder: 'Seleciona uma estação',
    allowClear: true
  });
  // $("#station_get").click(function () {
  //   window.location.search += `&search=${+$("#station[]").select2("val")}`;;});
})



// If your expected result is "http://foo.bar/?x=1&y=2&x=42"

