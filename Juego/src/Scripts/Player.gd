extends KinematicBody2D

const moveSpeed = 50
const maxSpeed = 85

const jumpHeight = -350
const up = Vector2(0,-1)
const gravity = 15
onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer
onready var jumpSound = $AudioStreamPlayer

var motion = Vector2()

func playJumpSound():
	if jumpSound.is_playing() == false:
		jumpSound.play()


func _physics_process(delta):
	
	motion.y +=gravity
	var friction=false
	
	if Input.is_action_pressed("move_right"):
		sprite.flip_h = false
		animationPlayer.play("Walk")
		motion.x = min(motion.x + moveSpeed, maxSpeed)
		if Input.is_action_pressed("jump"):
			animationPlayer.play("Jump")
			playJumpSound()
	   
	elif Input.is_action_pressed("move_left"):		
		sprite.flip_h = true
		animationPlayer.play("Walk")
		motion.x = max(motion.x - moveSpeed, -maxSpeed)
		if Input.is_action_pressed("jump"):
			animationPlayer.play("Jump")
			playJumpSound()
	
	elif Input.is_action_pressed("jump"):
			animationPlayer.play("Jump")
			playJumpSound()

	else:
		animationPlayer.play("Idle")
		friction = true
		
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			motion.y = jumpHeight
		if friction ==true:
			motion.x = lerp(motion.x,0,0.5)
	else:
		if friction ==true:
			motion.x=lerp(motion.x,0,0.01)
		
	motion = move_and_slide(motion,up);

