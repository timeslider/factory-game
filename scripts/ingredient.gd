class_name Ingredient
extends PrototypeBase

enum IngredientType {
	ITEM,
	FLUID,
}

enum IngredientName {
	SUNLIGHT,
}

@export var ingredient_type: IngredientType
@export var ingredient_name: IngredientName

## The amount you current have on hand.
@export var amount: int
