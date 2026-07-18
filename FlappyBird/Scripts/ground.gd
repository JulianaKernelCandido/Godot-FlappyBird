extends Node2D

var room_instance = null
var parallax_node = null

# Called when the node enters the scene tree for the first time.
func _ready():
	
	position.y += 20

	# Getting my node 
	parallax_node = get_node("Parallax2D")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

	var value = 2.6 * -60
	parallax_node.autoscroll.x = room_instance.global_velocity * value
