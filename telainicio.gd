extends Control

@export var quantidade_estrelas = 30
var estrela_cena = preload("res://estrelas.tscn")

func _ready():
	var tamanho_tela = get_viewport_rect().size
	for i in range(quantidade_estrelas):
		var estrela = estrela_cena.instantiate()
		estrela.position = Vector2(randf_range(0, tamanho_tela.x), randf_range(0, tamanho_tela.y))
		add_child(estrela)
	$VBoxContainer/botaoJogar.pressed.connect(_on_jogar)
	$VBoxContainer/botaoSair.pressed.connect(get_tree().quit)
	$VBoxContainer/botaoJogar.grab_focus()   # Enter também aciona o botão

func _on_jogar():
	get_tree().change_scene_to_file("res://world.tscn")
