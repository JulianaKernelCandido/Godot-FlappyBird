extends Node2D

var viewport_width = ProjectSettings.get_setting("display/window/size/viewport_width")
var viewport_height = ProjectSettings.get_setting("display/window/size/viewport_height")
var pipe_scene = preload("res://Scenes/Pipe.tscn")
var time_to_pipe = 0
var room_instance = null

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

func generate_pipe(minimun_space_between, displacement_value):

	# Generating an random integer value for space between pipe and its displacement 
	var space_between = randi_range(minimun_space_between, 35)
	var displacement = randi_range(-displacement_value, displacement_value)

	# Default Pipe Instance
	var pipe_instance = pipe_scene.instantiate()
	pipe_instance.space += space_between
	pipe_instance.displacement = displacement
	pipe_instance.room_instance = room_instance
	add_child(pipe_instance)

	# Inverted Pipe Instance
	var pipe_instance_inverted = pipe_scene.instantiate()
	pipe_instance_inverted.inverted = true
	pipe_instance_inverted.displacement = displacement
	pipe_instance_inverted.space += space_between
	pipe_instance_inverted.room_instance = room_instance
	add_child(pipe_instance_inverted)	


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

func _ready():
	pass

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

func _process(_delta):

	# Timer to generate an couple of pipes
	time_to_pipe -= 1

	if(time_to_pipe <= 0):
		generate_pipe(20, 30)
		time_to_pipe = 60
