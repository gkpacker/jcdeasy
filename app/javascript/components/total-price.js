// import Money from "js-money";
import accounting from "accounting";
// import formatMoney from "accounting";

const duration = document.getElementById("order_duration");

if (duration) {

  duration.addEventListener('change', (event) => {

    if (!(duration.value === "")) {

      if (!isNaN(duration.value)) {
        const total_price = document.getElementById("total_price")
        const price = total_price.dataset.price;
        const total = parseInt(price) * parseInt(duration.value/28);
        // total_price.innerHTML = `${new Money(parseInt(price), Money.BRL)} / mês * ${duration.value/28} meses = ${new Money(total, Money.BRL)}`;
        // total_price.innerHTML = `${accounting.formatMoney(parseInt(price)/100, "R$ ", 2, ".", ",")} / mês x ${duration.value/28} = ${accounting.formatMoney(total/100, "R$ ", 2, ".", ",")}`;
        total_price.innerHTML = `Total = ${accounting.formatMoney(total/100, "R$ ", 2, ".", ",")}`;
      }
    }
  })
};

