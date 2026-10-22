class_name CharacterData
extends Resource

var Portrait: Texture2D

var available_points: int = 0

var age: int = 20
var age_stage: String = "Adult"
@export var race: RaceData

#Basic Attributes
var nat_st: int = 10
var nat_dx: int = 10
var nat_iq: int = 10
var nat_ht: int = 10

var st: int = 0
var dx: int = 0
var iq: int = 0
var ht: int = 0

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
var build: String = 'Average'
var height_meters: float = 0.0
var size_modifier: int = 0

func calculate_base_attributes() -> void:
	st = int(floor(float(nat_st) * race.age_multipliers[age_stage]["st"]))
	dx = int(floor(float(nat_dx) * race.age_multipliers[age_stage]["dx"]))
	iq = int(floor(float(nat_iq) * race.age_multipliers[age_stage]["iq"]))
	ht = int(floor(float(nat_ht) * race.age_multipliers[age_stage]["ht"]))

func calculate_secondary_characteristics() -> void:
	basic_lift = int(snapped((st*st)/2.5,1))
	will = iq
	perception = iq
	fatigue_points = ht
	hit_points = st
	basic_speed = (dx + ht)/4
	basic_move = int(floor(basic_speed))

func get_age_stage() -> void:
	if race != null :
		age_stage = race.get_age_stage(age)
	else:
		age_stage = "Adult"

func calculate_size_modifier() -> void:
	if race != null:
		size_modifier = race.get_size_modifier_for_age(age)
	else:
		size_modifier = 0
	
	
	
