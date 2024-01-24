extends Node2D

@export var scenes = []
@onready var chatbox: RichTextLabel = $MarginContainer/Panel/Control2/Label
@onready var currentScene: Node2D = $CurrentScene
@onready var dayNightCycle: AnimationPlayer = $DayNightCycleAnimationPlayer
var index = 0;
	
func reload_current_scene():
	currentScene.get_child(0).queue_free()
	var newScene = scenes[index].instantiate();
	currentScene.add_child(newScene)
	chatbox.reset(newScene.dialogs, newScene.bossTexture)
	dayNightCycle.play("day_cycle")

func load_next_scene():
	currentScene.get_child(0).queue_free()
	index = index + 1;
	var newScene = scenes[index].instantiate();
	currentScene.add_child(newScene)
	chatbox.reset(newScene.dialogs, newScene.bossTexture)
	if index < scenes.size() - 1:	# Exclude credits scene
		dayNightCycle.play("day_cycle")
