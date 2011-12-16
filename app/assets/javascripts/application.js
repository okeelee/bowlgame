// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

!function( $ ){

  "use strict"

  /* DROPDOWN PLUGIN DEFINITION
   * ========================== */

  $.fn.dropdown = function ( selector ) {
    return this.each(function () {
      $(this).delegate(selector || d, 'click', function (e) {
        var li = $(this).parent('li')
          , isActive = li.hasClass('open')

        clearMenus()
        !isActive && li.toggleClass('open')
        return false
      })
    })
  }

  /* APPLY TO STANDARD DROPDOWN ELEMENTS
   * =================================== */

  var d = 'a.menu, .dropdown-toggle'

  function clearMenus() {
    $(d).parent('li').removeClass('open')
  }

  $(function () {
    $('html').bind("click", clearMenus)
    $('body').dropdown( '[data-dropdown] a.menu, [data-dropdown] .dropdown-toggle' )
  })

}( window.jQuery || window.ender );