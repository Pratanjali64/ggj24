extends Minigame

@onready var timer: Timer = $WinConditionTimer

func _on_win_condition_timer_timeout():
	timer.stop()
	winAnimation.play("success");

func _on_win_condition_2_area_entered(area):
	timer.start()


func _on_win_condition_2_area_exited(area):
	timer.stop()
