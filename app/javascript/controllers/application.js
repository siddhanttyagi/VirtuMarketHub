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
const form = document.querySelector("form");


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

form.addEventListener("submit", function (e) {
  e.preventDefault();
  isLocationFormVisible = false;
  sessionStorage.setItem(storageKey, "false");
  updateLocationFormVisibility();
  form.submit();
 
});


})

document.addEventListener("turbo:load", function () {
  const citySelect = document.getElementById('city-select');
  const areaContainer = document.getElementById('area-container');
  
  
  const cityAreas = {
    'Delhi': ['mohan nagar', 'cannaught place'],
    'Haridwar': ['shakti nagar', 'arya nagar chowk'],
    'Bangalore': ['kormangla', 'jp nagar'],
    'Pune': ['seva road', 'deva chowk'],
    'Mumbai': ['bombay road', 'sevai nagar'],
  };

  
  function updateAreaOptions() {
    const selectedCity = citySelect.value;
    const areas = cityAreas[selectedCity] || [];
    const areaSelect = areaContainer.querySelector('select');
    
    
    areaSelect.innerHTML = '';

    
    areas.forEach(area => {
      const option = document.createElement('option');
      option.value = area;
      option.text = area;
      areaSelect.appendChild(option);
    });

    
    localStorage.setItem('selectedCity', selectedCity);
  }

  
  const storedCity = localStorage.getItem('selectedCity');
  if (storedCity) {
    citySelect.value = storedCity;
  }

  // Initial update when the page loads
  updateAreaOptions();

  // Update options when the city select value changes
  citySelect.addEventListener('change', updateAreaOptions);
});


  document.addEventListener("DOMContentLoaded", function () {
    const slides = document.querySelectorAll(".carousel-slide");
    let currentSlide = 0;

    function showSlide(slideIndex) {
      slides[currentSlide].classList.remove("active");
      slides[slideIndex].classList.add("active");
      currentSlide = slideIndex;
    }

    // Automatically advance the carousel (you can also add manual controls)
    function nextSlide() {
      const nextIndex = (currentSlide + 1) % slides.length;
      showSlide(nextIndex);
    }

    // Change slides every 3 seconds
    setInterval(nextSlide, 3000);
  });









