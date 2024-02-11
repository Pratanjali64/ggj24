extends RigidBody2D

@onready var animationPlayer: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var rot = (360 + int(rotation_degrees)) % 360;
	print_debug(str(rot));
	if (rot > 5 and rot < 90):
		animationPlayer.play("teeter_right")
		
	elif (rot >= 90 and rot <180):
		lock_rotation = true;
		animationPlayer.play("collapse_right")
	
	elif (rot > 270 and rot < 355):
		animationPlayer.play("teeter_left")
		
	elif (rot <= 270 and rot >= 180):
		lock_rotation = true;
		animationPlayer.play("collapse_left")	
		
	else: #(!animationPlayer.is_playing()):
		animationPlayer.play("idle")
