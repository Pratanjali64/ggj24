extends Node2D

@onready var timer: Timer = $WinConditionTimer

func _on_win_condition_area_entered(area):
	timer.start()


func _on_win_condition_area_exited(area):
	timer.stop()


func _on_win_condition_timer_timeout():
	print_debug("Winner!");
