extends Control   # tela_vitoria.gd e tela_game_over.gd (iguais)

func _ready():
	$VBoxContainer/BotaoJogarDeNovo.pressed.connect(func():
		get_tree().change_scene_to_file("res://cenas/jogo.tscn"))
	$VBoxContainer/BotaoMenu.pressed.connect(func():
		get_tree().change_scene_to_file("res://cenas/tela_inicio.tscn"))
	$VBoxContainer/BotaoJogarDeNovo.grab_focus()
