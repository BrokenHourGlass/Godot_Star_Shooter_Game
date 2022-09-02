extends Node2D

onready var HUD = $HUD
var score = 0

func _ready():
	update_score(0)
	HUD.update_lives($"player container/Player".hp)

func spawnLaser(laser, location):
	var pew = laser.instance()
	add_child(pew)
	pew.global_position = location


func _on_EnemiesContainer_spawnEnemy(packedEnemyScene, location):
	var enemy = packedEnemyScene.instance()
	add_child(enemy)
	enemy.global_position = location
	if enemy.has_signal("spawnLaser"):
		enemy.connect("spawnLaser", self, "spawnLaser")
	enemy.connect("add_score", self, "_on_enemy_died")

func _on_enemy_died(_score):
	update_score(score + _score)

func update_score(val):
	score = val
	HUD.update_score(score)


func _on_Player_player_took_damage(hp_left):
	HUD.update_lives(hp_left)
