class_name PrototypeBase
extends Resource

enum Group {
	LOGISTIC,
	PRODUCTION,
	INTERMIDIATE_PRODUCTION,
	COMBAT,
}

enum SubGroup {
	AMMO,
}

@export var _name: String
@export var order: String
@export var description: String
@export var group: Group
@export var sub_group: SubGroup
@export var hidden: bool
