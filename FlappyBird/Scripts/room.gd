extends Node2D

var player_scene = preload("res://Scenes/Player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var player_instance = player_scene.instantiate()
	add_child(player_instance)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

	if(Input.is_action_pressed("Restart")):
		get_tree().reload_current_scene()