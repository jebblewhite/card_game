extends Node2D

const CARD_SLOT_SCENE_PATH = "res://scenes/card_slot.tscn"
const CARD_SLOT_DRAW_SPEED = 0.2


const MUV = 200

const TAVERN = {0:'NW', 1:'N', 2:'NE', 3:'W', 4:'C', 5:'E', 6:'SW', 7:'S', 8:'SE'}
const TAVERN_X = {'NW':-MUV, 'N':0, 'NE':MUV, 'W':-MUV, 'C':0, 'E':MUV, 'SW':-MUV, 'S':0, 'SE':MUV}
const TAVERN_Y = {'NW':-MUV, 'N':-MUV, 'NE':-MUV, 'W':0, 'C':0, 'E':0, 'SW':MUV, 'S':MUV, 'SE':MUV}

# Called when the node enters the scene tree for the first time.
func _ready():
	var TAVERN_CENTER_COORDS = Vector2(get_viewport_rect().size)/2
	print(TAVERN_CENTER_COORDS)
	for slot in TAVERN.values():
		var card_slot_scene = preload(CARD_SLOT_SCENE_PATH)
		var new_card_slot = card_slot_scene.instantiate()
		$"../card_slotter".add_child(new_card_slot)
		new_card_slot.name = 'tavern '+str(slot)
		new_card_slot.position = Vector2(TAVERN_CENTER_COORDS.x+TAVERN_X[slot], 
		TAVERN_CENTER_COORDS.y+TAVERN_Y[slot])*1.3
		print(new_card_slot.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
