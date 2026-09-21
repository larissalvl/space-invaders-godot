extends Area2D

@export var velocidade := 50.0
@export var distancia_descida := 100.0
@export var cenaBala: PackedScene

@onready var tempoTiro: Timer = $TiroTimer
@onready var inicioTiro: Marker2D = $PontoTiro

var y_parada: float
var descendo := true

func _ready() -> void:
	tempoTiro.wait_time = randf_range(1.5, 4.0)
	tempoTiro.timeout.connect(_on_shoot_timer_timeout)
	area_entered.connect(_on_area_entered)
	y_parada = position.y + distancia_descida

func _physics_process(delta: float) -> void:
	if descendo:
		position.y += velocidade * delta
		if position.y >= y_parada:
			position.y = y_parada
			descendo = false

func _on_shoot_timer_timeout() -> void:
	tiro()
	tempoTiro.wait_time = randf_range(1.5, 4.0)

func tiro() -> void:
	if cenaBala == null:
		return
	var bala = cenaBala.instantiate()
	bala.textura = load("res://tiroprov.png")
	bala.direcao = 1.0
	bala.global_position = inicioTiro.global_position
	bala.add_to_group("balaInimigo")
	get_tree().current_scene.add_child(bala)

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("balaJogador"):
		area.queue_free()
		queue_free()
