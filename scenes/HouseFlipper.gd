extends Minigame

@onready var timer: Timer = $WinConditionTimer
var winAnimation: AnimationPlayer

func _ready():
	winAnimation = get_parent().get_parent().find_child("AnimationPlayer");

func _on_win_condition_area_entered(area):
	timer.start()


func _on_win_condition_area_exited(area):
	timer.stop()


func _on_win_condition_timer_timeout():
	timer.stop()
	winAnimation.play("success");
