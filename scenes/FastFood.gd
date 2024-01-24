extends Minigame

@onready var burger: RigidBody2D = $Burger
@onready var speedLabel: Label = $Label
@onready var button: Button = $Burger/Button
var winAnimation: AnimationPlayer

var win = false

func _ready():
	winAnimation = get_parent().get_parent().find_child("AnimationPlayer");

func _process(delta):
	if !win:
		if burger.linear_velocity.length() > 5000:
			speedLabel.text = str(int(burger.linear_velocity.length() / 100)) + "mph";
			win = true;
			print_debug("Winner!");
			winAnimation.play("success");


func _on_speedometer_update_timer_timeout():
	speedLabel.text = str(int(burger.linear_velocity.length() / 100)) + "mph";
