extends Button

@export var grabber: NodePath
@export var grabberRigidBody: RigidBody2D
@export var house: NodePath
@export var pinJoint: PinJoint2D

var grabbing = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if grabbing:
		grabberRigidBody.global_position = get_viewport().get_mouse_position();


func _on_button_down():
	grabbing = true;
	pinJoint.node_a = grabber;
	pinJoint.node_b = grabber;
	grabberRigidBody.global_position = get_viewport().get_mouse_position();
	pinJoint.global_position = get_viewport().get_mouse_position()
	pinJoint.node_b = house;

func _on_button_up():
	pinJoint.node_b = grabber;
	grabbing = false;
