extends Control


func _ready():
	pass


func _on_start_pressed():
	get_tree().change_scene("res://scenes/World.tscn")


func _on_quit_pressed():
	get_tree().quit()
