extends Node2D

@onready var timer: Timer = $WinConditionTimer
var winSound: AudioStreamPlayer

func _ready():
	winSound = get_parent().find_child("WinSound");

func _on_win_condition_area_entered(area):
	timer.start()


func _on_win_condition_area_exited(area):
	timer.stop()


func _on_win_condition_timer_timeout():
	print_debug("Winner!");
	timer.stop()
	winSound.play();
