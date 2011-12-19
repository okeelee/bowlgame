$(function() {
  $( "table#pickTable tbody.editable" ).sortable({
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
  
  $("table#pickTable tbody.editable").bind( "sortupdate", function(e, ui){
    setPoints();
    postPickForm();
  });
  
  $("table#pickTable tbody.editable tr td.bowlTeam").click(function(){
    var $team = $(this);
    $team.addClass("pickedTeam");
    $team.siblings("td.bowlTeam").removeClass("pickedTeam");
    $team.siblings("td.confidence").find("input.pickTeamId").val($team.attr("data-team_id"));
    setPoints();
    postPickForm();
  });
  
  var setPoints = function(){
    var $points = $("input.pickPointsInput");
    var total = $points.size();
    $points.each(function(index){$(this).val(total-index);});
  };
  
  var postPickForm = function(){
    $.post(
      $("#pickForm").attr("action"), 
      $("#pickForm").serialize(), 
      function(data){},
      'json'
    );
  };
  
});