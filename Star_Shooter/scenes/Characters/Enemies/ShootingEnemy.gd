extends "res://scenes/Characters/Enemies/enemy.gd"

signal add_score(score)
signal spawnLaser(laser, location)

export (int) var score = 10

var Laser = preload("res://scenes/Characters/projectiles/enemyLaser.tscn")

onready var muzzle = $Position2D

func _ready():
	pass

func _physics_process(delta):
	global_position.y += speed*delta

func _on_Timer_timeout():
	emit_signal("spawnLaser", Laser, muzzle.global_position)


func _on_ShootingEnemy_area_entered(area):
	if !area.is_in_group("Enemies"):
		hp -= 1
		if area.is_in_group("deadzone"):
			queue_free()
		elif hp <= 0:
			emit_signal("add_score", score)
			queue_free()
