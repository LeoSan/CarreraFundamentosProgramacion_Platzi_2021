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

    fontFamily: {
      sans: ['Graphik', 'sans-serif'],
      serif: ['Merriweather', 'serif'],
    },
    extend: {
      colors: {
        cyan: '#9cdbff',
        'primary':'#F3C614', 
        'secundario':'#35353', 
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
