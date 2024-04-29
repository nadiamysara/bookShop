document.addEventListener( 'DOMContentLoaded', function() {
    // Fiction
    new Splide('#splideFiction', {
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

    // Non-fiction
    var splide = new Splide('#splideNonFiction', {
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
      })
      splide.on( 'overflow', function ( isOverflow ) {
        // Reset the carousel position
        splide.go( 0 );
      
        splide.options = {
          arrows    : isOverflow,
          pagination: isOverflow,
          drag      : isOverflow,
          clones    : isOverflow ? undefined : 0, // Toggle clones
        };
      } );
      splide.mount()
  } );