const bindDisableForm = () => {
  const button = document.getElementById('add-panel');
  const buttonCampaign = document.getElementById('add-campaign');

  const date = document.getElementById('order_date');
  const campaign = document.getElementById("order_campaign_id");

  const title = document.getElementById('campaign_title');
  const company = document.getElementById("campaign_company");

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

  title.addEventListener('keyup', (event) => {
    if (!(company.value === "")) {
      buttonCampaign.removeAttribute('disabled')
    } else {
      buttonCampaign.setAttribute('disabled', 'disabled')
    }
    if (title.value === "") {
      buttonCampaign.setAttribute('disabled', 'disabled')
    }
  });

  company.addEventListener('change', (event) => {
    if (!(title.value === "")) {
      buttonCampaign.removeAttribute('disabled')
    } else {
      buttonCampaign.setAttribute('disabled', 'disabled')
    }
    if (company.value === "") {
      buttonCampaign.setAttribute('disabled', 'disabled')
    }
  })
};


export { bindDisableForm }
