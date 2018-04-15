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
}

