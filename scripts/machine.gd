class_name Machine
extends Resource


## Machine is the base class for all machines
## Anything that generates anything is a machine
## Solar panels are a machine since they take in a recipe (sunlight)
## And output something (energy)

enum Type {
	POWER_PRODUCER,
	POWER_CONSUMER,
	CRAFTING,
}

@export var _name: String
@export var inputs: Dictionary[int, int]
