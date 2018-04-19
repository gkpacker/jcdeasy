import accounting from "accounting";

const duration = document.getElementById("order_duration");
duration.addEventListener('change', (event) => {

  if (!(duration.value === "")) {

    if (!isNaN(duration.value)) {
      const total_price = document.getElementById("total_price")
      const price = total_price.dataset.price;
      const total = parseInt(price) * parseInt(duration.value/28);
      total_price.innerHTML = `${accounting.formatMoney(total/100, "R$ ", 2, ".", ",")}`;
    }
  }
})

