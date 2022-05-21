extends KinematicBody2D

var velocity : Vector2 = Vector2()
var dirrection: Vector2 = Vector2()

func read_input():
	velocity = Vector2()
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
		
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * 200)
func _physics_process(delta):
	read_input()