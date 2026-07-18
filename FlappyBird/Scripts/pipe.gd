extends Node2D

var pos = Vector2.ZERO
var pipe_sprite = null
var pipe_width = null
var pipe_height = null
var inverted = false
var space = 52
var displacement = 0
var horizontal_velocity = 1.8
var viewport_width = ProjectSettings.get_setting("display/window/size/viewport_width")
var viewport_height = ProjectSettings.get_setting("display/window/size/viewport_height")
var room_instance = null

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

func _ready():

	# Getting and Setting my sprite height and width
	pipe_sprite = get_node("Sprite2D")
	pipe_width = pipe_sprite.texture.get_width()
	pipe_height = pipe_sprite.texture.get_height()

	# Setting initial horizontal position
	pos.x = viewport_width + pipe_width

	# Setting vertical position by the inverted condition variable
	if(!inverted):
		pos.y = displacement + (viewport_height - pipe_height) + space
	else:
		pos.y = displacement - space
		pipe_sprite.flip_v = true

	position = pos


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

func _process(_delta):

	pos.x -= (room_instance.global_velocity * 2)
	position = pos
