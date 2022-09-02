extends "res://scenes/Characters/projectiles/laser.gd"

func _on_laser_area_entered(area):
	if area.is_in_group("Enemies"):
		hp -= 1
		if hp <= 0:
			queue_free()
