extends Minigame

@onready var timer: Timer = $WinConditionTimer

func _on_win_condition_timer_timeout():
	timer.stop()
	winAnimation.play("success_noflash");
