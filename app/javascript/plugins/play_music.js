const vinyl1 = document.querySelector('.vinyl1')
const video1 = document.querySelector('#youtube1');
const vinyl2 = document.querySelector('.vinyl2')
const video2 = document.querySelector('#youtube2');
const vinyl3 = document.querySelector('.vinyl3')
const video3 = document.querySelector('#youtube3');

  // Beatles
vinyl1.addEventListener('mouseover', (event) => {
  video1.src = 'https://www.youtube.com/embed/oolpPmuK2I8?start=1&autoplay=1'; // assign url to src property
});
vinyl1.addEventListener('mouseleave', (event) => {
  video1.src = '';
});

  // Michael Jackson
vinyl2.addEventListener('mouseover', (event) => {
  video2.src = 'https://www.youtube.com/embed/dIQmcwSg0nU?start=2&autoplay=1'; // assign url to src property
});
vinyl2.addEventListener('mouseleave', (event) => {
  video2.src = '';
});

  // Rolling Stones
vinyl3.addEventListener('mouseover', (event) => {
  video3.src = 'https://www.youtube.com/embed/6HDdiz8MU8o?autoplay=1'; // assign url to src property
});
vinyl3.addEventListener('mouseleave', (event) => {
  video3.src = '';
});




