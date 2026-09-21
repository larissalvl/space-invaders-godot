extends Area2D

@export var player_id: int = 1
var speed: float = 300.0

var movEsquerda: String
var movDireita: String
var atirar: String

@export var cena_bala: PackedScene
@export var intervalo_tiro := 0.3
var pode_atirar := true


func _ready():
	if player_id == 1:
		movEsquerda = "Esquerda1"
		movDireita = "Direita1"
		atirar = "Atirar1"
	else:
		movEsquerda = "Esquerda2"
		movDireita = "Direita2"
		atirar = "Atirar2"
	area_entered.connect(_on_area_entered)

func _process(delta):
	var direcao = Input.get_axis(movEsquerda, movDireita)
	position.x += direcao * speed * delta
	
	var janelaJogo = get_viewport_rect().size.x
	position.x = clamp(position.x, 0, janelaJogo)

	if Input.is_action_pressed(atirar) and pode_atirar:
		tiro()
		
func tiro():
	pode_atirar = false
	for ponta in [$pontaD, $pontaE]:
		var bala = cena_bala.instantiate()
		bala.global_position = ponta.global_position
		get_tree().current_scene.add_child(bala)
		bala.add_to_group("balaJogador")
	await get_tree().create_timer(intervalo_tiro).timeout
	pode_atirar = true

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("balaInimigo"):
		area.queue_free()
		queue_free()

func levar_tiro():
	print("nave levou tiro")
	queue_free()
