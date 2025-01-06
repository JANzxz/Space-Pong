extends CharacterBody2D

var started = false
var start_speed = 500
var incremental_speed = 1.02
var angle = [-250, 250]
var pongs = 0
var max_speed = 1500

func _physics_process(delta):
	if Input.is_action_pressed("Start") and started == false:
		start_game()
		
	if started:
		var collision = move_and_collide(velocity*delta)
		if collision != null:
			if collision.get_collider().name == "TopWall":
				if(velocity.length() > max_speed):
					pongs += 1
					velocity = velocity.bounce(collision.get_normal()) * incremental_speed
				else:
					pongs += 1
					velocity = velocity.bounce(collision.get_normal()) * incremental_speed
			else:
				velocity = velocity.bounce(collision.get_normal())

func  start_game():
	started = true
	velocity.y = -start_speed
	velocity.x = angle. pick_random()
