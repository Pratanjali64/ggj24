extends RigidBody2D

@export var line: Line2D
@export var tvPlug: RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	line.set_point_position(0, position - line.position);
	line.set_point_position(1, tvPlug.position - line.position);
