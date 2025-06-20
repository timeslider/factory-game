class_name Recipe
extends PrototypeBase

enum RecipeCategoryID {
	ADVANCED_CRAFTING,
	BASIC_CRAFTING,
	CAPTIVE_SPAWNER_PROCESS,
	CENTRIFUGING,
	CHEMISTRY,
	CHEMISTRY_OR_CRYOGENICS,
	CRAFTING,
	CRAFTING_WITH_FLUID,
	CRAFTING_WITH_FLUID_OR_METALLURGY,
	CRUSHING,
	CRYOGENICS,
	CRYOGENICS_OR_ASSEMBLING,
	ELECTROMAGNETICS,
	ELECTRONICS,
	ELECTRONICS_OR_ASSEMBLING,
	ELECTRONICS_WITH_FLUID,
	METALLURGY,
	METALLURGY_OR_ASSEMBLING,
	OIL_PROCESSING,
	ORGANIC,
	ORGANIC_OR_ASSEMBLING,
	ORGANIC_OR_CHEMISTRY,
	ORGANIC_OR_HAND_CRAFTING,
	PARAMETERS,
	PRESSING,
	RECYCLING,
	RECYCLING_OR_HAND_CRAFTING,
	ROCKET_BUILDING,
	SMELTING
}

@export var category: RecipeCategoryID
@export var input_ingredients: Dictionary[Ingredient, int]
@export var output_ingredients: Dictionary[Ingredient, int]

## How long this recipe takes to make in seconds
@export var duration: float = 1.0

## "Made in" can be calcualted based on it's category 
func get_made_in() -> String:
	match category:
		# These return a string for now.
		# TODO: return a BBCode string with icons
		RecipeCategoryID.ADVANCED_CRAFTING:
			return "Assembing machine"
		RecipeCategoryID.BASIC_CRAFTING:
			return ""
		RecipeCategoryID.CAPTIVE_SPAWNER_PROCESS:
			return ""
		RecipeCategoryID.CENTRIFUGING:
			return ""
		RecipeCategoryID.CHEMISTRY:
			return ""
		RecipeCategoryID.CHEMISTRY_OR_CRYOGENICS:
			return ""
		RecipeCategoryID.CRAFTING:
			return ""
		RecipeCategoryID.CRAFTING_WITH_FLUID:
			return ""
		RecipeCategoryID.CRAFTING_WITH_FLUID_OR_METALLURGY:
			return ""
		RecipeCategoryID.CRUSHING:
			return "Crusher: " + "[img]uid://7f875oms6fs5[/img]"
		RecipeCategoryID.CRYOGENICS:
			return ""
		RecipeCategoryID.CRYOGENICS_OR_ASSEMBLING:
			return ""
		RecipeCategoryID.ELECTROMAGNETICS:
			return ""
		RecipeCategoryID.ELECTRONICS:
			return ""
		RecipeCategoryID.ELECTRONICS_OR_ASSEMBLING:
			return ""
		RecipeCategoryID.ELECTRONICS_WITH_FLUID:
			return ""
		RecipeCategoryID.METALLURGY:
			return ""
		RecipeCategoryID.METALLURGY_OR_ASSEMBLING:
			return ""
		RecipeCategoryID.OIL_PROCESSING:
			return ""
		RecipeCategoryID.ORGANIC:
			return ""
		RecipeCategoryID.ORGANIC_OR_ASSEMBLING:
			return ""
		RecipeCategoryID.ORGANIC_OR_CHEMISTRY:
			return ""
		RecipeCategoryID.ORGANIC_OR_HAND_CRAFTING:
			return ""
		RecipeCategoryID.PARAMETERS:
			return ""
		RecipeCategoryID.PRESSING:
			return ""
		RecipeCategoryID.RECYCLING:
			return ""
		RecipeCategoryID.RECYCLING_OR_HAND_CRAFTING:
			return ""
		RecipeCategoryID.ROCKET_BUILDING:
			return ""
		RecipeCategoryID.SMELTING:
			return ""
	return "Something went wrong. Did you remove a recipe category? " + str(category)

### Used during testing to check if 
#func check_duplicate() -> void:
	#pass
