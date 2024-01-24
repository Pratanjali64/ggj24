extends Minigame

@onready var burger: RigidBody2D = $Burger
@onready var speedLabel: Label = $TV/Label
@onready var button: Button = $Burger/Button
@onready var timer: Timer = $SpeedometerUpdateTimer

var win = false

const orangeThreshold = 500;
const redThreshold = 5000;

func _process(delta):
	if !win:
		if burger.linear_velocity.length() > redThreshold:
			timer.stop();
			_on_speedometer_update_timer_timeout()
			win = true;
			winAnimation.play("success");


func _on_speedometer_update_timer_timeout():
	speedLabel.text = "Order No. " + str(int(burger.linear_velocity.length() / 100));
	if (burger.linear_velocity.length() >= orangeThreshold):
		speedLabel.modulate = Color.ORANGE
	if (burger.linear_velocity.length() >= redThreshold):
		speedLabel.modulate = Color.RED
	else:
		speedLabel.modulate = Color.AQUAMARINE
