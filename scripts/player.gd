extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D
@onready var jump_voice = %"跳跃"
@onready var run_voice = %"奔跑"
@onready var timer = $Timer

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("跳跃") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_voice.play()
		

	#获取输入方向，可能是-1,0,1（左，停，右）
	var direction = Input.get_axis("向左移动", "向右移动")
	
	#翻转精灵图
	if direction > 0 :
		animated_sprite.flip_h = false
	elif direction < 0 :
		animated_sprite.flip_h = true
		
	#控制玩家动画
	if is_on_floor():
		if  direction == 0:
			animated_sprite.play("空闲")
		else :
			animated_sprite.play("奔跑")
			
	else :
		animated_sprite.play("跳跃")
		
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	#if not velocity.x == 0 and is_on_floor() and timer.stop():
		#timer.start()

	move_and_slide()
	
#func _on_timer_timeout():
	#run_voice.play()
