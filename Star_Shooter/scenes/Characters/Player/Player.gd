extends Area2D

signal spawnLaser(laser, location)
signal player_took_damage(hp_left)

onready var laserSound = $laser
onready var hitSound = $hit

export(int) var speed = 100
export(int) var hp = 3

var input_vector = Vector2.ZERO

var Laser = preload("res://scenes/Characters/projectiles/PlayerLaser.tscn")
onready var muzzle = $muzzle

func _ready():
	pass

func _physics_process(delta):
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	global_position.x += input_vector.x*speed*delta
	global_position.y += input_vector.y*speed*delta
	
	global_position.x = clamp(global_position.x, 0, 600)
	global_position.y = clamp(global_position.y, 0, 1024)
	
	if Input.is_action_just_pressed("shoot"):
		emit_signal("spawnLaser", Laser, muzzle.global_position)
		laserSound.play()


func _on_Player_area_entered(area):
	if area.is_in_group("Enemies"):
		hp -= 1
		emit_signal("player_took_damage", hp)
		hitSound.play()
		if hp <= 0:
			queue_free()
