extends KinematicBody2D

var velocity : Vector2 = Vector2()
var dirrection: Vector2 = Vector2()


var active = false

func _ready():
	connect("body_entered", self, '_on_spy_body_entered')
	connect("body_exited", self, '_on_spy_body_exited')

func _process(delta):

	$sprite_question_mark.visible = active

func _on_spy_body_entered(body):
	if body.name == 'spy':
		active = true

func _on_spy_body_exited(body):
	if body.name == 'spy':
		active = false

func read_input():
	velocity = Vector2()
	if Input.is_action_pressed("down") or Input.is_action_pressed("ui_down"):
		velocity.y += 1
		$AnimationPlayer.play("Walk_down")
	elif Input.is_action_pressed("up") or Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		$AnimationPlayer.play("Walk_back")
	elif Input.is_action_pressed("left") or Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		$AnimationPlayer.play("Walk_left")
	elif Input.is_action_pressed("right") or Input.is_action_pressed("ui_right"):
		velocity.x += 1
		$AnimationPlayer.play("Walk_right")
	else:
		$AnimationPlayer.stop() 
		
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * 200)
func _physics_process(delta):
	read_input()
