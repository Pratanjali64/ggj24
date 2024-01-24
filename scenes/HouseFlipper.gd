extends Node2D

@onready var timer: Timer = $WinConditionTimer
var winAnimation: AnimationPlayer

@export var dialogs : Array;

func _ready():
	winAnimation = get_parent().get_parent().find_child("AnimationPlayer");

func _on_win_condition_area_entered(area):
	timer.start()


func _on_win_condition_area_exited(area):
	timer.stop()


func _on_win_condition_timer_timeout():
	print_debug("Winner!");
	timer.stop()
	winAnimation.play("success");
