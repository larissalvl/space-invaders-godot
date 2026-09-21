extends Node2D

@export var quantidade_estrelas = 30
var estrela_cena = preload("res://estrelas.tscn")

@export var linhas := 5
@export var colunas := 7
@export var espacamento_x := 150.0
@export var espacamento_y := 60.0
@export var margem_topo := -90.0
@export var atraso_entre_linhas := 10.0


var enemy_cena = preload("res://enemy.tscn")

var terminou := false

func _ready():
	var tamanho_tela = get_viewport_rect().size
	for i in range(quantidade_estrelas):
		var estrela = estrela_cena.instantiate()
		estrela.position = Vector2(randf_range(0, tamanho_tela.x), randf_range(0, tamanho_tela.y))
		add_child(estrela)
	spawnar_inimigos(tamanho_tela/3.3)
	
func _process(_delta):
	if terminou:
		return

	if get_tree().get_nodes_in_group("jogadores").is_empty():
		terminou = true
		get_tree().change_scene_to_file("res://gameOver.tscn")
	elif get_tree().get_nodes_in_group("inimigos").is_empty():
		terminou = true
		get_tree().change_scene_to_file("res://telaVitoria.tscn")


func spawnar_inimigos(tamanho_tela: Vector2) -> void:
	var largura_formacao = (colunas - 1) * espacamento_x
	var inicio_x = (tamanho_tela.x - largura_formacao) / 2.0

	for linha in range(linhas):
		for coluna in range(colunas):
			var inimigo = enemy_cena.instantiate()
			inimigo.position = Vector2(
				inicio_x + coluna * espacamento_x,
				margem_topo + linha * espacamento_y
			)
			add_child(inimigo)
		await get_tree().create_timer(atraso_entre_linhas).timeout
