extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0

func _physics_process(delta: float) -> void:
	process_movement()
	move_and_slide()

func process_movement() -> void:
	
	var direction := Input.get_vector("left", "right", "up","down")
	
	velocity = direction * SPEED
	play_animacion(direction)

func play_animacion(dir: Vector2) -> void:
	if dir.x > 0:
		#right
		animated_sprite_2d.play("idle")
	elif dir.x < 0:
		#left
		animated_sprite_2d.play("idle")
	elif dir.y < 0:
		#up
		animated_sprite_2d.play("move_up")
	elif dir.y > 0:
		#down
		animated_sprite_2d.play("move_down")
