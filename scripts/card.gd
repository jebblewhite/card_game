extends Node2D

signal hovered
signal unhovered

var hand_position

# Called when the node enters the scene tree for the first time.
func _ready():
	# all cards must be a child of card_manager or this will error
	get_parent().connect_card_signals(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_mouse_entered():
	emit_signal("hovered", self)


func _on_area_2d_mouse_exited():
	emit_signal("unhovered", self)
