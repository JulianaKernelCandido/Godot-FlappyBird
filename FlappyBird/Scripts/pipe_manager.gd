extends Node2D

var viewport_width = ProjectSettings.get_setting("display/window/size/viewport_width")
var viewport_height = ProjectSettings.get_setting("display/window/size/viewport_height")
var pipe_scene = preload("res://Scenes/Pipe.tscn")
var time_to_pipe = 0

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

func generate_pipe():
	# Generating an random integer value for space between pipe and its displacement 
	var space_between = randi_range(0, 50)
	var displacement = randi_range(-50, 50)

	# Default Pipe Instance
	var pipe_instance = pipe_scene.instantiate()
	pipe_instance.space += space_between
	pipe_instance.displacement = displacement
	add_child(pipe_instance)

	# Inverted Pipe Instance
	var pipe_instance_inverted = pipe_scene.instantiate()
	pipe_instance_inverted.inverted = true
	pipe_instance_inverted.displacement = displacement
	pipe_instance_inverted.space += space_between
	add_child(pipe_instance_inverted)	

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

func _ready():
	pass

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

func _process(_delta):

	# Timer to generate an couple of pipes
	time_to_pipe -= 1

	if(time_to_pipe <= 0):
		generate_pipe()
		time_to_pipe = 60
