$(function() {
  $(".outcome_actions .show_predict").click(function(){
    $(".outcome_prediction").toggle();
  });
  
  $(".outcome_actions .generate_prediction").click(function(){
    predictOutcome();
  });
  
  var predictOutcome = function(){
    var $outcomes = $("#outcome_form .outcome input:checked");
    var outcomeHash = {};
    $.each($outcomes, function(key,input){
      outcomeHash[parseInt(input.name.match(/\[(\d*?)\]/)[1])] = input.value;
    });
    var $standings = $(".standings .standing");
    $standings.each(function(index){
        var user_picks = $.parseJSON($(this).attr("data-picks"));
        var points = 0;
        $.each(user_picks, function(key,pick){
          if(outcomeHash[key] == pick.team_id){
            points += pick.points;
          }else{
            if (pick.points == null || pick.team_id == null){
              points -= 35;
            }else{
              points -= pick.points;
            }
          }
        });
        $score=$(this).find(".score");
        $score.removeClass("positive").removeClass("negative").html(points);
        if(points>0){
          $score.addClass("positive");
        }else if(points<0){
          $score.addClass("negative");
        }
    });
    $standings.tsort(".score",{order:"desc"});
  };
});