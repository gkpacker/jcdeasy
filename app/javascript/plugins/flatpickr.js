import flatpickr from "flatpickr";

const dates = document.querySelectorAll(".dates")
const disableDates = []
dates.forEach((date)=> {
  disableDates.push({
    from: date.dataset.datefrom,
    to: date.dataset.dateto
  })
});

flatpickr(".panel-date", {
    dateFormat: "Y/m/d",
    minDate: new Date().fp_incr(10),
    disable: disableDates,
    onValueUpdate: close()
});
