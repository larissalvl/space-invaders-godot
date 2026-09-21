extends Control   # tela_vitoria.gd e tela_game_over.gd (iguais)

func _ready():
	$VBoxContainer/botaoJogarDnv.pressed.connect(func():
		get_tree().change_scene_to_file("res://world.tscn"))
	$VBoxContainer/botaoMenu.pressed.connect(func():
		get_tree().change_scene_to_file("res://telaInicio.tscn"))
	$VBoxContainer/botaoJogarDnv.grab_focus()
