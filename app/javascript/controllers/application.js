import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }


document.addEventListener("turbo:load", function () {
const showLocationFormLink = document.getElementById("show-location-form");
const hideLocationFormButton = document.getElementById("hide-location-form");
const locationForm = document.getElementById("location-form");
const storageKey = "locationFormVisible";
let isLocationFormVisible = sessionStorage.getItem(storageKey) === "true";
const updateLocationFormVisibility = () => {
    if (isLocationFormVisible) {
      locationForm.style.display = "block";
    } else {
      locationForm.style.display = "none";
    }
  };

  updateLocationFormVisibility();

showLocationFormLink.addEventListener("click", function (e) {
    e.preventDefault();
    isLocationFormVisible = true;
    sessionStorage.setItem(storageKey, "true");
    updateLocationFormVisibility();
    
});

hideLocationFormButton.addEventListener("click", function (e) {
    e.preventDefault();
    isLocationFormVisible = false;
    sessionStorage.setItem(storageKey, "false");
    updateLocationFormVisibility();
    
});
});
