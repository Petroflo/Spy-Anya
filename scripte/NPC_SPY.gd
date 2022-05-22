extends Area2D

var active = false
var enter = true

func _physics_process(delta):
		$Spy/AnimationPlayer.play("Move_Right")

func _ready():
	connect("body_entered", self, '_on_NPC_SPY_body_entered')
	connect("body_exited", self, '_on_NPC_SPY_body_exited')

func _process(delta):
	$sprite_question_mark.visible = active
	$Enter.visible = enter

func _input(event):
	if get_node_or_null('DialogeNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			get_tree().paused = true
			var dialog = Dialogic.start('timeline-spynpc')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)

func unpause(timeline_name):
	get_tree().paused = false

func _on_NPC_SPY_body_entered(body):
	if body.name == 'player':
		enter = true
		active = true

func _on_NPC_SPY_body_exited(body):
	if body.name == 'player':
		enter = false
		active = false
