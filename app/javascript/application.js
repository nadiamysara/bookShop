// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
//= require bootstrap
//= require jquery3
//= require jquery_ujs
//= require popper

// Popup Image
// Get the modal
var modal = document.getElementById("myModal");
// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById("img-t");
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
img.onclick = function(){
  modal.style.display = "block";
  modalImg.src = this.src;
  captionText.innerHTML = this.alt;
}
// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];
// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
  modal.style.display = "none";
}

// Splide carousel
splide = new Splide('.splide', {
  type: 'loop',
  autoplay: true,
  arrows: true,
  perPage: 5,
  breakpoints: {
    380: {
      perPage: 1,
    },
    540: {
      perPage: 2,
    },
    720: {
      perPage: 3,
    },
    960: {
      perPage: 4,
    },
  }
}).mount();