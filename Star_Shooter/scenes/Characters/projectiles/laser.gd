extends Area2D

export (int) var speed = 999

export (int) var hp = 1

export(int, -1, 1) var vdirection = 1

func _ready():
	pass

func _physics_process(delta):
	global_position.y += speed*delta*vdirection


func _on_enemyLaser_area_entered(area):
	if !area.is_in_group("Enemies"):
		hp -= 1
		if hp <= 0:
			queue_free()
