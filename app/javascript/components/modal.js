$('.modal').on('hidden.bs.modal', function(e) {
  $('body').removeClass('modal-open');
  $('.modal-backdrop').remove()
})
