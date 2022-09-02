extends Node2D

signal spawnEnemy(packedEnemyScene, location)

export (Array, PackedScene) var enemies

var spawn_positions = null

func _ready():
	randomize()
	spawn_positions = $SpawnPositions.get_children()


func _on_SpawnTimer_timeout():
	randomEnemy()

func randomEnemy():
	var random = enemies[randi()%enemies.size()]
	var randIndex = randi()%spawn_positions.size()
	emit_signal("spawnEnemy", random, spawn_positions[randIndex].global_position)
