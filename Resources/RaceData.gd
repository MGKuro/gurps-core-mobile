extends Resource
class_name RaceData

@export var race_name: String = "Human"

@export var age_thresholds = {
	"Infant": 2,
	"Child": 5,
	"Young": 10,
	"Adult": 15,
	"Aged Adult": 50,
	"Old": 70,
	"Venerable": 90
}

@export var size_modifiers = {
	"Newborn": -4,
	"Infant": -3,
	"Child": -2,
	"Young": -1,
	"Adult": 0,
	"Aged Adult": 0,
	"Old": 0,
	"Venerable": 0
}

@export var age_multipliers = {
	"Newborn": {"st": 0.1, "dx": 0.1, "iq": 0.1, "ht": 0.5},
	"Infant": {"st": 0.3, "dx": 0.4, "iq": 0.5, "ht": 0.5},
	"Child": {"st": 0.6, "dx": 0.7, "iq": 0.7, "ht": 1.0},
	"Young": {"st": 0.8, "dx": 0.9, "iq": 0.9, "ht": 1.0},
	"Adult": {"st": 1.0, "dx": 1.0, "iq": 1.0, "ht": 1.0},
	"Aged Adult": {"st": 0.9, "dx": 0.9, "iq": 1.0, "ht": 0.9},
	"Old": {"st": 0.8, "dx": 0.8, "iq": 0.9, "ht": 0.8},
	"Venerable": {"st": 0.7, "dx": 0.7, "iq": 0.9, "ht": 0.7},
}


func get_age_stage(age: int) -> String:
	var keys = age_thresholds.keys()
	keys.sort_custom(func(a, b): return age_thresholds[a] < age_thresholds[b])
	var curr_age_stage: String = "Newborn"
	
	for y in keys:
		if age >= age_thresholds[y]:
			curr_age_stage = y
		else:
			break
	
	return curr_age_stage

func get_size_modifier_for_age(age: int) -> int:
	var stage = get_age_stage(age)
	return size_modifiers.get(stage, 0)
