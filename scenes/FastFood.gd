extends Node2D

@onready var burger: RigidBody2D = $Burger
@onready var speedLabel: Label = $Label
@onready var button: Button = $Burger/Button

var win = false

func _process(delta):
	speedLabel.text = str(int(burger.linear_velocity.length() / 100)) + "mph";
	if !win:
		if burger.linear_velocity.length() > 5000 and !button.grabbing:
			win = true;
			print_debug("Winner!");
