// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(function() {
  var fixHelper = function(e, ui){ui.children().each(function() {$(this).width($(this).width());});return ui;};
  
  $( "table#pickTable tbody" ).sortable({
    items:"tr", 
    helper:function(e, ui){
      ui.children().each(function() {
        $(this).width($(this).width());
      });
      return ui;
    },
    start:function(){
      $("tr.pickContainerHighlight").append($("<td>").attr("colspan",4));
    },
    update:function(e,ui){
      
    },
    axis:"y",
    placeholder:"pickContainerHighlight",
    forcePlaceholderSize:"true",
    forceHelperSize:"true",
    containment: 'parent',
    tolerance:'pointer',
    opacity:0.8
  }).disableSelection();
});