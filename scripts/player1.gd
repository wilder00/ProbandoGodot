extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


export (int) var speed = 200

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right_button'):
		velocity.x += 1
	if Input.is_action_pressed("left_button"):
		velocity.x -= 1
	if Input.is_action_pressed('down_button'):
		velocity.y += 1
	if Input.is_action_pressed('up_button'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
