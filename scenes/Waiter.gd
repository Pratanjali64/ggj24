extends Minigame

@onready var timer: Timer = $WinConditionTimer

var winEligible = true;

func _input(event):
	winEligible = false;

func _on_win_condition_timer_timeout():
	timer.stop()
	if winEligible:
		winAnimation.play("success");
