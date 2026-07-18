extends Node2D

var pos = Vector2.ZERO
var horizontal_velocity = 0
var vertical_velocity = 0
var gravity = 0.3
var player_sprite = null
var viewport_width = ProjectSettings.get_setting("display/window/size/viewport_width")
var viewport_height = ProjectSettings.get_setting("display/window/size/viewport_height")
var is_dead = false
var dead_animation = true

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

func _ready():

	# Initial position on the Room scene 
	pos.x = viewport_width 	* 0.5
	pos.y = viewport_height * 0.2

	position = pos


	# Getting my node and animating it
	player_sprite = get_node("AnimatedSprite2D")
	player_sprite.play("fly")

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

func _process(_delta):

	#Player Logic - - - - - - -  - - - - - - 

	vertical_velocity += gravity
	pos.y += vertical_velocity
	pos.x += horizontal_velocity

	position = pos

	# If im not dead
	if(Input.is_action_just_pressed("Fly") and !is_dead):
		vertical_velocity = -6
		player_sprite.frame = 1


	# Player Animation - - - - - - - - - - -

	# When player dies
	if(is_dead and dead_animation):	
		vertical_velocity = -6
		horizontal_velocity = -3
		dead_animation = false

	# Rotation Degree by the vertical_velocity value
	if(!is_dead):
		rotation_degrees = vertical_velocity * 10	
	else:
		rotation_degrees -= 10

	if(vertical_velocity > 0):
		if(player_sprite.frame >= 0):
			player_sprite.frame = 0

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

func _on_area_2d_area_entered(area):
	if(area.is_in_group("pipe")):
		is_dead = true
