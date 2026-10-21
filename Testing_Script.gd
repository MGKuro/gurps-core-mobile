extends Control

@onready var character: Node2D = $Character


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print(DamageTable.get_damage_dice(109,false))
	character.character_data.calculate_secondary_characteristics()
	print(character.character_data.basic_lift)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
