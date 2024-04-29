document.addEventListener( 'DOMContentLoaded', function() {
    new Splide('.splide', {
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
  } );