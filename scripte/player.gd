extends KinematicBody2D

var velocity : Vector2 = Vector2()
var direction: Vector2 = Vector2()
var speed = 600
var pos


func read_input():
	velocity = Vector2()
	if Input.is_action_pressed("down") or Input.is_action_pressed("ui_down"):
		velocity.y = speed
		$AnimationPlayer.play("Walk_down")
	elif Input.is_action_pressed("up") or Input.is_action_pressed("ui_up"):
		velocity.y = -speed
		$AnimationPlayer.play("Walk_back")
	elif Input.is_action_pressed("left") or Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		$AnimationPlayer.play("Walk_left")
	elif Input.is_action_pressed("right") or Input.is_action_pressed("ui_right"):
		velocity.x = speed
		$AnimationPlayer.play("Walk_right")
	else:
		velocity.x = 0
		velocity.y = 0
		$AnimationPlayer.stop() 
	pos = position.y
	print(pos)
	move_and_slide(velocity, Vector2(0, 0), false, 4, 0.785, false)
	#for index in get_slide_count():
	#	var collision = get_slide_collision(index)
	#	if collision.collider.is_in_group("spy"):
	# 		print("coucou", collision.collider.name)

func _on_spy_area_entered(area):
	if area.get_parent().name.begins_with("spy"):
		print("coucou", area.get_parent().get_name())

func _on_Area2D_area_entered(area):
	if area.get_parent().name.begins_with("spy"):
		print("coucou", area.get_parent().get_name())

func _physics_process(delta):
	read_input()
