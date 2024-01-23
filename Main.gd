extends Node2D

@export var scenes = []
@onready var currentScene: Node2D = $CurrentScene
var index = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_next_scene():
	currentScene.get_child(0).queue_free()
	index = index + 1;
	currentScene.add_child(scenes[index].instantiate())
	
