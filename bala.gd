extends Area2D

@export var textura: Texture2D
@export var direcao := -1.0 # -1 pra cima (jogador), 1 pra baixo (inimigo)
@export var velocidade := 700.0

@onready var sprite: Sprite2D = $Sprite2D

func _physics_process(delta):
	position.y += direcao * velocidade * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	print("bala direcao=", direcao, " encostou em: ", area.name)
	if direcao < 0 and area.is_in_group("inimigos"):      # tiro do jogador acerta inimigo
		area.queue_free()
		queue_free()
	elif direcao > 0 and area.is_in_group("jogadores"):   # tiro do inimigo acerta nave
		area.levar_tiro()
		queue_free()
		
func _ready() -> void:
	if textura:
		$Sprite2D.texture = textura
