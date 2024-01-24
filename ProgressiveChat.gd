extends RichTextLabel

@onready var soundEffect: AudioStreamPlayer = $AudioStreamPlayer;
@onready var timer : Timer = $Timer;
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer

@export var currentSceneParent: Node2D;
var dialogs : Array;

var timeExisted = 0
var inlineIndex = 0;
var lineIndex = 0;

var originalPos = Vector2(0, 0)

func reset(txt):
	inlineIndex = 0;
	lineIndex = 0;
	timeExisted = 0;
	dialogs = txt
	text = "";
	animationPlayer.play("textbox_shake");
	timer.timeout.connect(_on_timer_timeout);

func _ready():
	reset(currentSceneParent.get_child(0).dialogs)
	
func _process(delta):
	timeExisted += delta
		
func _on_timer_timeout() -> void:
	var dialogEdited = dialogs[lineIndex];
	if(inlineIndex < dialogEdited.length()):
		if(dialogEdited[inlineIndex] != " "):
			soundEffect.play();
			position = originalPos + Vector2(randf_range(-1, 1), randf_range(-1, 1));
		
		if (dialogEdited[inlineIndex] == "*"):
			text += "[b]"
		elif (dialogEdited[inlineIndex] == "%"):
			text += "[/b]"
		else: 
			text += dialogEdited[inlineIndex];

	if (inlineIndex > dialogEdited.length() + 20):
		if (lineIndex < dialogs.size() - 1):
			lineIndex = lineIndex + 1;
			inlineIndex = -1;
	inlineIndex = inlineIndex + 1;
