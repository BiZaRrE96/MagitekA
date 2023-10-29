extends CharacterBody2D


const ACCELERATION = 50.0
const MAX_SPEED = 300.0
const FRICTION = 100.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var Xdirection = Input.get_axis("move_left", "move_right")
	var Ydirection = Input.get_axis("move_up", "move_down")
	
	if (Xdirection > 0):
		velocity.x = move_toward(velocity.x, MAX_SPEED, ACCELERATION)
	elif (Xdirection < 0):
		velocity.x = move_toward(velocity.x, -MAX_SPEED, ACCELERATION)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION) # should be friction instead
		
	if (Ydirection > 0):
		velocity.y = move_toward(velocity.y, MAX_SPEED, ACCELERATION)
	elif (Ydirection < 0):
		velocity.y = move_toward(velocity.y, -MAX_SPEED, ACCELERATION)
	else:
		velocity.y = move_toward(velocity.y, 0, FRICTION) # should be friction instead

	move_and_slide()
