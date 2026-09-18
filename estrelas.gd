extends AnimatedSprite2D

func _ready():
	speed_scale = randf_range(0.15, 0.4)
	modulate.a = randf_range(0.4, 0.7)
	frame = randi_range(0, sprite_frames.get_frame_count("brilhoEstrela") - 1)
	play("brilhoEstrela")
