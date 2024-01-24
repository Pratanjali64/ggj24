extends Minigame

@onready var burger: RigidBody2D = $Burger
@onready var speedLabel: Label = $Label
@onready var button: Button = $Burger/Button

var win = false

func _process(delta):
	if !win:
		if burger.linear_velocity.length() > 5000:
			speedLabel.text = str(int(burger.linear_velocity.length() / 100)) + "mph";
			win = true;
			winAnimation.play("success");


func _on_speedometer_update_timer_timeout():
	speedLabel.text = str(int(burger.linear_velocity.length() / 100)) + "mph";
