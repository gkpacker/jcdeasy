import Rails from 'rails-ujs';
import swal from 'sweetalert2';

const handleConfirm = function(element) {
    if (!allowAction(this)) {
      Rails.stopEverything(element)
    }
  }

  const allowAction = element => {
    if (element.getAttribute('data-confirm-swal') === null) {
      return true
    }

    showConfirmationDialog(element)
    return false
  }

  // Display the confirmation dialog
  const showConfirmationDialog = element => {
    const message = element.getAttribute('data-confirm-swal')
    const text = element.getAttribute('data-text')

    swal({
      title: "Você tem certeza que quer apagar este item?",
      text: ' ',
      type: 'warning',
      customClass: 'sweet-confirm',
      confirmButtonColor: '#fda403',
      cancelButtonText: 'Cancelar',
      confirmButtonText: 'Apagar',
      reverseButtons: true,
      showCancelButton: true,
    }).then(result => confirmed(element, result))
  }

  const confirmed = (element, result) => {
    if (result.value) {
      // User clicked confirm button
      const companies = document.querySelector("#companies-list")
      const list = document.querySelector(".company-list-ul")
      element.removeAttribute('data-confirm-swal')
      element.click()
      element.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.remove()
      if (companies.childElementCount === 0) {
        list.insertAdjacentHTML("afterbegin", "<em><h5>Você ainda não possui empresas registradas</h5></em>")
      }
      swal({
            title: 'Deletado!',
            text: 'Seu arquivo foi deletado.',
            type: 'success',
            buttons: 'false',
            timer: 2000,
          }
      )
    }
  }


// Add event listener before the other Rails event listeners like the one
// for `method: :delete`
Rails.delegate(document, 'a[data-confirm-swal]', 'click', handleConfirm)

Rails.start()
