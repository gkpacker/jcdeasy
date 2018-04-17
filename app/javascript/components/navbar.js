function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-wagon');
  window.addEventListener('scroll', () => {
    if (window.scrollY >= window.innerHeight) {
      navbar.classList.remove('navbar-wagon');
      navbar.classList.add('navbar-wagon-grey');
    } else {
      navbar.classList.remove('navbar-wagon-grey');
      navbar.classList.add('navbar-wagon');
    }
  });
}

export { initUpdateNavbarOnScroll };
