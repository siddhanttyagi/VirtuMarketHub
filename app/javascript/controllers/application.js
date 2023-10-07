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


  // Define an object to store city-to-area mappings
  const cityToAreas = {
    Delhi: ['Mohan Nagar', 'Shakti Nagar'],
    Haridwar: ['kankhal', 'upper road'],
    Bangalore: ['kormangla', 'jp nagar'],
    Pune: ['kotwali ', 'arya nagar chowk'],
    Mumbai: ['bomabay road', 'mansoor nagar'],
  };

  // Get references to the city and area select elements
  const citySelect = document.getElementById('city-select');
  const areaSelect = document.getElementById('area-select');
  const areaGroup = document.getElementById('area-group');

  // Event listener to update the area options when the city is selected
  citySelect.addEventListener('change', function () {
    const selectedCity = citySelect.value;
    const areas = cityToAreas[selectedCity] || [];

    // Clear the current options
    areaSelect.innerHTML = '';

    // Add new options for the selected city
    areas.forEach((area) => {
      const option = document.createElement('option');
      option.text = area;
      areaSelect.add(option);
    });

    // Show/hide the area select based on whether a city is selected
    if (selectedCity) {
      areaGroup.style.display = 'block';
    } else {
      areaGroup.style.display = 'none';
    }
  });


