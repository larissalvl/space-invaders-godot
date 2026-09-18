extends CharacterBody2D

var velNaveBase = 250
var velNaveAtual = velNaveBase
var velAngularBase = PI/2
var velAngularAtual = velAngularBase

func _ready():
	var sprite = $AnimatedSprite2D
	sprite.play("Jogador1")
	

func _process(delta):
	if Input.is_action_pressed("paraEsquerda"):
		rotation -= velAngularAtual * delta
	if Input.is_action_pressed("paraDireita"):
		rotation += velAngularAtual * delta
	if Input.is_action_pressed("paraTras"):
		var movNave = Vector2.DOWN.rotated(rotation) * velNaveAtual
		position += movNave * delta
	if Input.is_action_pressed("paraFrente"):
		var movNave = Vector2.UP.rotated(rotation) * velNaveAtual
		position += movNave * delta
