import flatpickr from "flatpickr";

document.addEventListener("DOMContentLoaded", () => {
  const dates = document.querySelectorAll(".dates")
  const disableDates = []
  dates.forEach((date)=> {
    disableDates.push({
      from: date.dataset.datefrom,
      to: date.dataset.dateto
    })
  });

  flatpickr(".panel-date", {
      dateFormat: "d/m/Y",
      minDate: new Date().fp_incr(15),
      disable: disableDates,
      onValueUpdate: close()
  });
})
