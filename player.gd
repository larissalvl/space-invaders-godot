extends Area2D

@export var player_id: int = 1
var speed: float = 300.0

var movEsquerda: String
var movDireita: String
var atirar: String

func _ready():
	if player_id == 1:
		movEsquerda = "Esquerda1"
		movDireita = "Direita1"
		atirar = "Atirar1"
	else:
		movEsquerda = "Esquerda2"
		movDireita = "Direita2"
		atirar = "Atirar1"

func _process(delta):
	var direction = Input.get_axis(movEsquerda, movDireita)
	position.x += direction * speed * delta
	
	var janelaJogo = get_viewport_rect().size.x
	position.x = clamp(position.x, 0, janelaJogo)

	if Input.is_action_pressed(atirar):
		#shoot()
		pass
