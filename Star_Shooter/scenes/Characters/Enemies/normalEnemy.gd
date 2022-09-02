extends Area2D

signal add_score(score)

export (int) var hp = 1
export (int) var speed = 300
export (int) var score = 10

func _ready():
	pass

func _physics_process(delta):
	global_position.y += speed*delta


func _on_enemy_area_entered(area):
	if !area.is_in_group("Enemies"):
		hp -= 1
		if area.is_in_group("deadzone"):
			queue_free()
		elif hp <= 0:
			emit_signal("add_score", score)
			queue_free()
