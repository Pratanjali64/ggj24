extends Node2D
class_name Minigame

@export var dialogs: Array;
@export var bossTexture: Texture2D
var winAnimation: AnimationPlayer

func _ready():
	winAnimation = get_parent().get_parent().find_child("AnimationPlayer");
