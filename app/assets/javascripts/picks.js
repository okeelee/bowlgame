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
    axis:"y",
    placeholder:"pickContainerHighlight",
    forcePlaceholderSize:"true",
    forceHelperSize:"true",
    containment: 'parent',
    tolerance:'pointer',
    opacity:0.8
  }).disableSelection();
  
  $("table#pickTable tbody").bind( "sortupdate", function(e, ui){
    var $points = $("input.pickPointsInput");
    var total = $points.size();
    $points.each(function(index){$(this).val(total-index);});
    postPickForm();
  });
  
  $("td.bowlTeam").click(function(){
    var $team = $(this);
    $team.addClass("pickedTeam");
    $team.siblings("td.bowlTeam").removeClass("pickedTeam");
    $team.siblings("td.confidence").find("input.pickTeamId").val($team.attr("data-team_id"));
    postPickForm();
  });
  
  var postPickForm = function(){
    $.post(
      $("#pickForm").attr("action"), 
      $("#pickForm").serialize(), 
      function(data){},
      'json'
    );
  };
  
});