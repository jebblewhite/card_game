extends Node2D

const CARD_SCENE_PATH = "res://scenes/card.tscn"
const CARD_DRAW_SPEED = 0.2
var player_deck = ['Tudor', 'Tudor', 'Tudor', 'Tudor', 'Tudor']

# Called when the node enters the scene tree for the first time.
func _ready():
	$"./card_counter".text = str(player_deck.size())


func draw_card():
	var card_drawn = player_deck[0]
	player_deck.erase(card_drawn)
	
	if player_deck.size() == 0:
		$"./Area2D/CollisionShape2D".disabled = true
		$"./Sprite2D".visible = false
		$"./card_counter".visible = false
	
	$"./card_counter".text = str(player_deck.size())
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	$"../card_manager".add_child(new_card)
	new_card.name = 'card'
	$"../player_hand".add_card_to_hand(new_card, CARD_DRAW_SPEED)
