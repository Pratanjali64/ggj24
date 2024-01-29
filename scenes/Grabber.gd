extends RayCast2D

@export var grabber: NodePath
@export var grabberRigidBody: RigidBody2D
@export var pinJoint: PinJoint2D

# Load the custom images for the mouse cursor.
var cursor_open = load("res://textures/hand_open.png")
var cursor_closed = load("res://textures/hand_closed.png")


func _ready():
	Input.set_custom_mouse_cursor(cursor_open)

var grabbing = false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_viewport().get_mouse_position();
	if grabbing:
		grabberRigidBody.global_position = get_viewport().get_mouse_position();
		
func _input(event):
	if event.is_pressed() and "button_index" in event and event.button_index == MOUSE_BUTTON_LEFT:
		if is_colliding():
			grabbing = true;
			pinJoint.node_b = grabber;
			grabberRigidBody.global_position = get_viewport().get_mouse_position();
			pinJoint.global_position = get_viewport().get_mouse_position()
			pinJoint.node_b = get_collider().get_path();
			Input.set_custom_mouse_cursor(cursor_closed)
	if event.is_released() and "button_index" in event and event.button_index == MOUSE_BUTTON_LEFT:
		pinJoint.node_b = grabber;
		grabbing = false;
		Input.set_custom_mouse_cursor(cursor_open)
