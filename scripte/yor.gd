extends KinematicBody2D

var motion = Vector2()
var speed = 600
var statue = 0



func _physics_process(delta):
	motion = Vector2()
	if statue == 1:
		motion.y = 0
		motion.x = -800
	elif statue == 2:
		motion.x = 0
		motion.y = -100
	else:
		motion.y = 0
		motion.x = 0
	
	

	if Input.is_action_pressed("ui_select"):
		position.y = pl.pos
		position.x = 1000
		statue = 1
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.name.begins_with("player"):
			statue = 2
		if collision.collider.name.begins_with("spy"):
			print("lol")
			statue = 0
#	print(motion.y)
#	print(motion.x)
	move_and_slide(motion, Vector2(0, 0))