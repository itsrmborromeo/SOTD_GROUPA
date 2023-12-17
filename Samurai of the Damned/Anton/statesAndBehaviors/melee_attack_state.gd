extends NodeState
@export var character_body_2d : CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D
@export var strike_zone : Area2D
@export var loc: int
var direction : int
var player : CharacterBody2D
var counter = 1
func on_process(delta:float):
	pass
func on_physics_process(delta:float):
	if counter ==1:
		animated_sprite_2d.play("attack_1")
	elif counter == 2:
		animated_sprite_2d.play("attack_2")
	elif counter == 3:
		animated_sprite_2d.play("attack_3")
		counter = 1
func enter():
	character_body_2d.velocity.x = 0
	character_body_2d.move_and_slide()
	player = get_tree().get_nodes_in_group("Player")[0] as CharacterBody2D
	if character_body_2d.global_position > player.global_position:
			animated_sprite_2d.flip_h = true
			direction = -1
	elif character_body_2d.global_position < player.global_position:
			animated_sprite_2d.flip_h = false
			direction = 1
	strike_zone.position.x = loc * direction
	if counter < 3:
		counter += 1
	strike_zone.monitorable = true
func exit():
	strike_zone.position.x = 0
	strike_zone.monitorable = false

