extends Node2D

var cur_speed
var walk_spd = 1.0
var run_sped = 2.0

var action_status
var animator
var animation_status

enum Move {
	left = KEY_A
	right = KEY_D
	run = KEY_SHIFT}

func _ready():
	cur_speed = 0.0
	action_status = false
	animation_status = 'idle'
	
	animator = self.get_child(0).get_child(0).get_child(0)
	pass

func _process(delta):
	_movement()

func _movement() :
	var direction = Vector2(0.0, 0.0)
	var flip = false
	if Input.is_key_pressed(Move.left):
		direction = Vector2(-1.0, 0.0)
		flip = true
		pass
	elif Input.is_key_pressed(Move.right):
		direction = Vector2(1.0, 0.0)
		flip = false
		pass
	else:
		cur_speed = 0.0
		animator.set_current_animation('idle')
		return
	self.get_child(0).get_child(0).set_flip_h(flip)
	_withspeed(direction)
	pass

func _withspeed(direction):
	if Input.is_key_pressed(Move.run) : 
		cur_speed = run_sped
		animator.set_current_animation('run')
	else : 
		cur_speed = walk_spd
		animator.set_current_animation('Kilgore')
	self.translate(cur_speed * direction)
	pass