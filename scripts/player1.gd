extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


export (int) var speed = 80

var velocity = Vector2()
var anim_direction = "down"
var anim_direction_state
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right_button'):
		anim_direction = "right"
		velocity.x += 1
	if Input.is_action_pressed("left_button"):
		anim_direction = "left"
		velocity.x -= 1
	if Input.is_action_pressed('down_button'):
		anim_direction = "down"
		velocity.y += 1
	if Input.is_action_pressed('up_button'):
		anim_direction = "up"
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
		anim_direction_state = "go_" + anim_direction
	else:
		$AnimatedSprite.stop()
		anim_direction_state = "stop_" + anim_direction
		#print_debug($AnimatedSprite.animation)
	$".".get_node("AnimatedSprite").set("animation", anim_direction_state)
		
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
