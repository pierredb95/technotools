const trackNames = document.querySelectorAll(".track-name");
console.log(trackNames[0].dataset.url);
const iframe = document.getElementById("iframe");

if (trackNames) {
  trackNames.forEach( trackName => {
    trackName.addEventListener("click", (event) => {
      event.preventDefault();
      const key = trackName.dataset.url;
      iframe.src = "https://www.youtube.com/embed/" + key;
    });
  })};

