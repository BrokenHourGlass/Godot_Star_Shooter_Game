extends Control

onready var score_label = $Label
onready var lives = $livesTexture

func update_score(val):
	score_label.text = "Score: " + str(val)

func update_lives(val):
	lives.rect_size.x = 37*val
