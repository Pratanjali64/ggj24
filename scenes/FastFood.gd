extends Node2D

@onready var burger: RigidBody2D = $Burger
@onready var speedLabel: Label = $Label
@onready var button: Button = $Burger/Button

var win = false

func _process(delta):
	if !win:
		if burger.linear_velocity.length() > 5000 and !button.grabbing:
			speedLabel.text = str(int(burger.linear_velocity.length() / 100)) + "mph";
			win = true;
			print_debug("Winner!");


func _on_speedometer_update_timer_timeout():
	speedLabel.text = str(int(burger.linear_velocity.length() / 100)) + "mph";
