extends Area2D

var active = false

func _physics_process(delta):
		$boy/AnimationPlayer.play("Move_Up")

func _ready():
	connect("body_entered", self, '_on_boy_body_entered')
	connect("body_exited", self, '_on_boy_body_exited')

func _process(delta):
	$sprite_question_mark.visible = active

func _input(event):
	if get_node_or_null('DialogeNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			get_tree().paused = true
			var dialog = Dialogic.start('timeline-bart')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)

func unpause(timeline_name):
	get_tree().paused = false

func _on_boy_body_entered(body):
	if body.name == 'player':
		active = true

func _on_boy_body_exited(body):
	if body.name == 'player':
		active = false
