extends Minigame

@onready var burger: RigidBody2D = $Burger
@onready var speedLabel: Label = $TV/Label
@onready var button: Button = $Burger/Button
@onready var timer: Timer = $SpeedometerUpdateTimer
@onready var progressBar: ProgressBar = $TV/ProgressBar;
@onready var progressSound: AudioStreamPlayer = $TV/SuccessSound
@onready var failureSound: AudioStreamPlayer = $TV/FailureSound

var win = false
var progressIncrements: int = 0

const orangeThreshold = 500;
const redThreshold = 5000;

func _process(delta):
	progressBar.value = 34 * progressIncrements
	if !win:
		if progressIncrements >= 3:
			timer.stop();
			_on_speedometer_update_timer_timeout()
			win = true;
			winAnimation.play("success");


func _on_speedometer_update_timer_timeout():
	speedLabel.text = "Order No. " + str(int(burger.linear_velocity.length() / 100));
	if (burger.linear_velocity.length() >= redThreshold):
		speedLabel.modulate = Color.RED
		if progressIncrements < 3:
			progressSound.play()
			progressIncrements = progressIncrements + 1
	elif (burger.linear_velocity.length() >= orangeThreshold):
		speedLabel.modulate = Color.ORANGE
	else:
		speedLabel.modulate = Color.AQUAMARINE
		if progressIncrements > 0:
			failureSound.play()
			progressIncrements = progressIncrements - 1
