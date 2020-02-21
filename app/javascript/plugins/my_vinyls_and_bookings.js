const myVinylsButton = document.getElementById('my_vinyls');
const myOrdersButton = document.getElementById('my_bookings');

const my_vinyls = document.querySelector('.my-vinyls');
const my_bookings = document.querySelector('.my-bookings');



myVinylsButton.addEventListener('click', (event) => {
  event.preventDefault();
  my_vinyls.classList.remove('d-none');
  my_bookings.classList.add('d-none');
});

myOrdersButton.addEventListener('click', (event) => {
  event.preventDefault();
  my_vinyls.classList.add('d-none');
  my_bookings.classList.remove('d-none');
});
