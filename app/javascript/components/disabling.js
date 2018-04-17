const bindDisableForm = () => {
  const button = document.getElementById('add-panel');

  const date = document.getElementById('order_date');
  const campaign = document.getElementById("order_campaign_id");

  date.addEventListener('change', (event) => {
    if (!(campaign.value === "")) {
      button.removeAttribute('disabled')
    }
  });

  campaign.addEventListener('change', (event) => {
    if (!(date.value === "")) {
      button.removeAttribute('disabled')
    }
  })
};
export { bindDisableForm }
