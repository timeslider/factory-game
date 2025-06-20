extends Sprite2D

var animator: float

func _process(delta: float) -> void:
	region_rect.position.x += delta * -10
