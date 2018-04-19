const bindDisablePanelForm = () => {
  const button = document.getElementById('add-panel');
  const date = document.getElementById('order_date');
  const campaign = document.getElementById("order_campaign_id");

  date.addEventListener('change', (event) => {
    if (!(campaign.value === "")) {
      button.removeAttribute('disabled')
    } else {
      button.setAttribute('disabled', 'disabled')
    }
    if (date.value === "") {
      button.setAttribute('disabled', 'disabled')
    }
  });

  campaign.addEventListener('change', (event) => {
    if (!(date.value === "")) {
      button.removeAttribute('disabled')
    } else {
      button.setAttribute('disabled', 'disabled')
    }
    if (campaign.value === "") {
      button.setAttribute('disabled', 'disabled')
    }
  })

};


const bindDisableCampaignForm = () => {
  const buttonCampaign = document.querySelectorAll('#add-campaign');
  const allTitles = document.querySelectorAll('#campaign_title');
  const allCompanies = document.querySelectorAll("#campaign_company");

  allTitles.forEach((title)=>{
    title.addEventListener('keyup', (event) => {
      const company = title.parentElement.parentElement.parentElement.querySelector('select')
      if (!(company.value === "")) {
        buttonCampaign.forEach((button)=>{
          button.removeAttribute('disabled')
        })
      } else {
        buttonCampaign.forEach((button)=>{
          button.setAttribute('disabled', 'disabled')
        })
      }
      if (title.value === "") {
        buttonCampaign.forEach((button)=>{
          button.setAttribute('disabled', 'disabled')
        })
      }
    });
  })
  allCompanies.forEach((company)=> {
    company.addEventListener('change', (event) => {
      const title =  company.parentElement.parentElement.querySelector("#campaign_title")
      if (!(title.value === "")) {
        buttonCampaign.forEach((button)=>{
          button.removeAttribute('disabled')
        })
      } else {
        buttonCampaign.forEach((button)=>{
          button.setAttribute('disabled', 'disabled')
        })
      }
      if (company.value === "") {
        buttonCampaign.forEach((button)=>{
          button.setAttribute('disabled', 'disabled')
        })
      }
    })
  })
}


export { bindDisablePanelForm, bindDisableCampaignForm }
