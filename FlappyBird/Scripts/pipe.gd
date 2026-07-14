extends Node2D

var pos = Vector2.ZERO
var pipe_sprite = null
var pipe_width = null
var pipe_height = null
var inverted = false
var horizontal_velocity = 1
var viewport_width = ProjectSettings.get_setting("display/window/size/viewport_width")
var viewport_height = ProjectSettings.get_setting("display/window/size/viewport_height")

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

func _ready():

	# Getting and Setting my sprite height and width
	pipe_sprite = get_node("Sprite2D")
	pipe_width = pipe_sprite.texture.get_width()
	pipe_height = pipe_sprite.texture.get_height()

	# Setting my location
	pos.x = viewport_width + pipe_width
	if(!inverted):
		pos.y = viewport_height - pipe_height
	else:
		pos.y = 0
		pipe_sprite.flip_v = true


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

func _process(_delta):

	pos.x -= horizontal_velocity
	position = pos
