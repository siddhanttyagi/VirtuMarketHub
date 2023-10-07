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

document.addEventListener("turbo:load", function () {
  const citySelect = document.getElementById('city-select');
  const areaContainer = document.getElementById('area-container');
  
  // Define areas for each city
  const cityAreas = {
    'Delhi': ['Area1', 'Area2'],
    'Haridwar': ['Area3', 'Area4'],
    'Bangalore': ['Area5', 'Area6'],
    'Pune': ['Area7', 'Area8'],
    'Mumbai': ['Area9', 'Area10'],
  };

  // Function to update the area options
  function updateAreaOptions() {
    const selectedCity = citySelect.value;
    const areas = cityAreas[selectedCity] || [];
    const areaSelect = areaContainer.querySelector('select');
    
    // Clear existing options
    areaSelect.innerHTML = '';

    // Add new options
    areas.forEach(area => {
      const option = document.createElement('option');
      option.value = area;
      option.text = area;
      areaSelect.appendChild(option);
    });

    // Store the selected city in localStorage
    localStorage.setItem('selectedCity', selectedCity);
  }

  // Initialize the city select with the stored value from localStorage
  const storedCity = localStorage.getItem('selectedCity');
  if (storedCity) {
    citySelect.value = storedCity;
  }

  // Initial update when the page loads
  updateAreaOptions();

  // Update options when the city select value changes
  citySelect.addEventListener('change', updateAreaOptions);
});






