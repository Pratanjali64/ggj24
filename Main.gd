extends Node2D

@export var scenes = []
@onready var chatbox: RichTextLabel = $MarginContainer/Panel/Control2/Label
@onready var currentScene: Node2D = $CurrentScene
@onready var dayNightCycle: AnimationPlayer = $DayNightCycleAnimationPlayer
@export var index = 0; # Exported start index for ease of debugging

func _ready():
	reload_current_scene();

func reload_current_scene():
	if currentScene.get_child_count() > 0:
		currentScene.get_child(0).queue_free()
	var newScene = scenes[index].instantiate();
	currentScene.add_child(newScene)
	chatbox.reset(newScene.dialogs, newScene.bossTexture)
	if index != 0 and index < scenes.size() - 1:	# Exclude intro and credits scene
		dayNightCycle.play("day_cycle")

func load_next_scene():
	if currentScene.get_child_count() > 0:
		currentScene.get_child(0).queue_free()
	currentScene.get_child(0).queue_free()
	index = index + 1;
	var newScene = scenes[index].instantiate();
	currentScene.add_child(newScene)
	chatbox.reset(newScene.dialogs, newScene.bossTexture)
	if index < scenes.size() - 1:	# Exclude intro and credits scene
		dayNightCycle.play("day_cycle")
