module.exports = {
  purge: {
    content: ['./public/**/*.html'],
  },
  darkMode: false, // or 'media' or 'class'
  theme: {
    cursor: {
      auto: 'auto',
      default: 'default',
      pointer: 'pointer',
      wait: 'wait',
      text: 'text',
      move: 'move',
      'not-allowed': 'not-allowed',
      crosshair: 'crosshair',
      'zoom-in': 'zoom-in',
  },

  screens: {
    'tablet': '640px',
    // => @media (min-width: 640px) { ... }

    'laptop': '1024px',
    // => @media (min-width: 1024px) { ... }

    'desktop': '1280px',
    // => @media (min-width: 1280px) { ... }
  },

    fontFamily: {
      rale: ['Raleway'],
      dancing: ['Dancing Script'],
      
    },
    extend: {
      colors: {
        cyan: '#9cdbff',
        primary:'#F3C614', 
        secundario:'#', 
        danger:'#BB371A',
        info:{
          100:'#39A2DB',
          200:'#A2DBFA',
        }
      },

    },
	  height:{
		'80':'20rem'
	  }

  },
  variants: {
    cursor: ['hover', 'focus'],
    opacity: ['responsive', 'hover', 'focus', 'disabled'],
    scale: ['hover'],
    rotate:['responsive'],
    extend: {
      padding: ['hover'],
      maxHeight: ['focus'],
      opacity: ['disabled'],
    },
  },
  plugins: [],
}
