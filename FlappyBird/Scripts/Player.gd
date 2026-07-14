extends Node2D

var pos = Vector2.ZERO
var vertical_velocity = 0
var gravity = 0.3
var player_sprite = null
var viewport_width = ProjectSettings.get_setting("display/window/size/viewport_width")
var viewport_height = ProjectSettings.get_setting("display/window/size/viewport_height")

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

func _ready():

	# Initial position on the Room scene 
	pos.x = viewport_width 	* 0.5
	pos.y = viewport_height * 0.2

	# Getting my node and animating it
	player_sprite = get_node("AnimatedSprite2D")
	player_sprite.play("fly")

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

func _process(_delta):
	
	#Player Logic - - - - - - - - - - - - - 

	vertical_velocity += gravity
	pos.y += vertical_velocity

	position = pos

	# Player Animation - - - - - - - - - - -

	if(Input.is_action_just_pressed("Fly")):
		vertical_velocity = -6
		player_sprite.frame = 1

	rotation_degrees = vertical_velocity * 10

	if(vertical_velocity > 0):
		if(player_sprite.frame >= 0):
			player_sprite.frame = 0
	
