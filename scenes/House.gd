extends RigidBody2D

@onready var animationPlayer: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var rot = (360 + int(rotation_degrees)) % 360;
	print_debug(str(rot));
	if (rot > 25 and rot < 90):
		if (!animationPlayer.is_playing()):
			animationPlayer.play("teeter_left")
	elif (rot > 270 and rot < 335):
		if (!animationPlayer.is_playing()):
			animationPlayer.play("teeter_right")
	else:
		if (!animationPlayer.is_playing()):
			animationPlayer.play("idle")
