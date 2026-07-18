extends Node2D

var global_velocity = 1
var player = null
var ground_scene = preload("res://Scenes/Ground.tscn")
var player_scene = preload("res://Scenes/Player.tscn")
var pipe_manager_scene = preload("res://Scenes/PipeManager.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():

	# Pipe Manager instance - - - - - - - - - - - - - - - - -
	var pipe_manager_instance = pipe_manager_scene.instantiate()
	add_child(pipe_manager_instance)

	# Giving to the pipe manager my ID
	pipe_manager_instance.room_instance = self


	# Player instance - - - - - - - - - - - - - - - - - - - - 
	var player_instance = player_scene.instantiate()
	add_child(player_instance)

	# Getting my player instance on a global scope variable
	player = player_instance


	# Ground instance - - - - - - - - - - - - - - - - - - - -
	var ground_instance = ground_scene.instantiate()
	add_child(ground_instance)

	ground_instance.room_instance = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

	if(player.is_dead):
		global_velocity = lerpf(global_velocity, 0, 0.1)

	# Debug - - - - - - - - - - - - - - - - - - - -
	if(Input.is_action_pressed("Restart")):
		get_tree().reload_current_scene()
