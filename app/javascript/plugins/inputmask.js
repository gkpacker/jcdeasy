import Inputmask from "inputmask";

const phone_number = document.querySelector("#user_phone_number");

const im = new Inputmask("+5599999999999");
im.mask(phone_number);

