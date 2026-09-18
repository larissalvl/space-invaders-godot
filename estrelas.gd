extends AnimatedSprite2D

func _ready():
	speed_scale = randf_range(0.5, 1.5)
	frame = randi_range(0, sprite_frames.get_frame_count("brilhoEstrela") - 1)
	play("brilhoEstrela")
