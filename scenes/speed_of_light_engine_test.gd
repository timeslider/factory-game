extends VBoxContainer

@onready var mass: Label = %Mass
@onready var h_slider_mass: HSlider = %HSliderMass
@onready var joules: Label = %Joules
@onready var h_slider_2_joules: HSlider = %HSlider2Joules
@onready var velocity: Label = %Velocity
@onready var h_slider_3_velocity: HSlider = %HSlider3Velocity


var v_sqr: float = 0.0
var c_sqr: int = 89_875_517_873_681_764


func _ready() -> void:
	print(c_sqr)
	pass

func gamma():
	return 1.0 / sqrt(1 - (v_sqr / c_sqr))
