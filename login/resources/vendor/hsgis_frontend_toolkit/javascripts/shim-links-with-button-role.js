// javascript 'shim' to trigger the click event of element(s)
// when the space key is pressed.
//
;(function (global) {
  'use strict'

  var $ = global.jQuery
  var HSGIS = global.HSGIS || {}

  HSGIS.shimLinksWithButtonRole = {

    init: function init () {
      // listen to 'document' for keydown event on the any elements that should be buttons.
      $(document).on('keydown', '[role="button"]', function (event) {
        // if the keyCode (which) is 32 it's a space, let's simulate a click.
        if (event.which === 32) {
          event.preventDefault()
          // trigger the target's click event
          event.target.click()
        }
      })
    }

  }

  // hand back to global
  global.HSGIS = HSGIS
})(window)
