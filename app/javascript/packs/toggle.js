document.addEventListener("turbolinks:load", () => {
  const arrow = document.querySelector('#arrow');
  const description = document.querySelector('.description');

  arrow.onclick = function() {
    description.classList.toggle('is-hidden');
    arrow.classList.toggle('rotate');
  };
});
