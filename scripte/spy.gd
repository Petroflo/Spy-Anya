extends Area2D

var active = false

func _ready():
	connect("body_entered", self, '_on_spy_body_entered')
	connect("body_exited", self, '_on_spy_body_exited')

func _process(delta):
	$sprite_question_mark.visible = active

func _on_spy_body_entered(body):
	if body.name == 'player':
		active = true

func _on_spy_body_exited(body):
	if body.name == 'player':
		active = false
