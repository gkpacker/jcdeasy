import Inputmask from "inputmask";

if (document.querySelector("#user_phone_number")) {
  const phone_number = document.querySelector("#user_phone_number");

  const im = new Inputmask("(55)(99)99999-9999");
  im.mask(phone_number);
}
if (document.querySelector("#company_cnpj")) {
  const cnpj = document.querySelector("#company_cnpj");

  const im = new Inputmask("99.999.999/9999-99");
  im.mask(cnpj);
}
if (document.querySelector("#user_cpf")) {
  const cpf = document.querySelector("#user_cpf");

  const im = new Inputmask("999.999.999-99");
  im.mask(cpf);
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
      address1.value = data.logradouro
      city.value = data.cidade
      state.value = data.estado
      address2.value = data.bairro
      street_number.value = ''
    });
  })
}
