extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("attack"):
		var GrassEffect = load("res://Action RPG Resources/Effects/TallGrassEffect.tscn")
		var grassEffect = GrassEffect.instance()
		var main = get_tree().current_scene
		queue_free()
		
