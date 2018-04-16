import Inputmask from "inputmask";

if (document.querySelector("#user_phone_number")) {
  const phone_number = document.querySelector("#user_phone_number");

  const im = new Inputmask("+5599999999999");
  im.mask(phone_number);
}
if (document.querySelector("#company_zip_code")) {
  const zipcode = document.querySelector("#company_zip_code");
  const im = new Inputmask("99999-999");
  im.mask(zipcode);
  zipcode.addEventListener('blur', (event) => {
    const address1 = document.querySelector("#company_address1");
    const address2 = document.querySelector("#company_address2");
    const city = document.querySelector("#company_city");
    const state = document.querySelector("#company_state");
    const street_number = document.querySelector("#company_street_number");
    fetch(`http://api.postmon.com.br/v1/cep/${zipcode.value}`)
    .then((response) => response.json())
    .then((data) => {
      console.log(data)
      address1.value = data.logradouro
      city.value = data.cidade
      state.value = data.estado
      address2.value = data.bairro
      street_number.value = ''
    });
  })
}
