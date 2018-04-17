const button = document.getElementById('add-panel');

while ((document.getElementById('order_date') === "") || (document.getElementById("order_campaign_id").value === "")) {
  button.setAttribute('disabled', "");
}
