extends KinematicBody2D


onready var sprite = $Enemy
onready var animationPlayer = $AnimationPlayer
var velocity = Vector2()
var direction = 1

func _ready():
	animationPlayer.play("Walking")
	if direction == -1:
		sprite.flip_h = true
	


func _physics_process(delta: float) -> void:
	if is_on_wall() and is_on_floor():
		direction = direction * -1
		sprite.flip_h = not sprite.flip_h 
		
	velocity.y += 20
	velocity.x = 50 * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	
func _on_CollisionArea_body_entered(body):
	if body.get_name() == "Player":
		print("Colision jugador")
		get_tree().reload_current_scene()
