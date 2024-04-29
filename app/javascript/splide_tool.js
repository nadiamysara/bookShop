document.addEventListener( 'DOMContentLoaded', function() {
  var elms = document.getElementsByClassName( 'carouselGenre' );
  for ( var i = 0; i < elms.length; i++ ) {
    var genre = new Splide( elms[ i ] , {
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
    genre.on( 'overflow', function ( isOverflow ) {
      // Reset the carousel position
      genre.go( 0 );
    
      genre.options = {
        arrows    : isOverflow,
        pagination: isOverflow,
        drag      : isOverflow,
        clones    : isOverflow ? undefined : 0, // Toggle clones
      };
    } );
    genre.mount()
  }

  // Non-fiction 
  /*new Splide('#splideNonFiction', {
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
  }).mount() */
} );