class_name CharacterData
extends Resource

var Portrait: Texture2D

var available_points: int = 0

#Basic Attributes
var st: int = 10
var dx: int = 10
var iq: int = 10
var ht: int = 10

#Secondary Characteristics
var damage_dice_number: int = 0
var damage_dice_modifier: int = 0
var basic_lift: int = 0
var will: int = 0
var hit_points: int = 0
var perception: int = 0
var fatigue_points: int = 0
var basic_speed: float = 0.0
var basic_move: int = 0.0
var encumbrance: int = 0

#build
var build: String = 'NoBuild'
var height: float = 0.0

func calculate_secondary_characteristics() -> void:
	basic_lift = int(snapped((st*st)/2.5,1))
	will = iq
	perception = iq
	fatigue_points = ht
	hit_points = st
	basic_speed = (dx + ht)/4
	basic_move = int(floor(basic_speed))
	
	
