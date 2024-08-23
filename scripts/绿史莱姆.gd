extends Node2D

const SPEED = 60

var direction = 1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_down_right = $RayCastDown_Right
@onready var ray_cast_down_left = $RayCastDown_Left
@onready var animated_sprite = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if ray_cast_right.is_colliding():
		direction = -1
	if ray_cast_left.is_colliding():
		direction = 1
		
	if ray_cast_down_right.is_colliding() and bool(ray_cast_down_left.is_colliding()) == false :
		direction = 1
	elif ray_cast_down_left.is_colliding() and bool(ray_cast_down_right.is_colliding()) == false :
		direction = -1

	animated_sprite.flip_h = bool(direction - 1)
	
	position.x += direction * SPEED * delta
