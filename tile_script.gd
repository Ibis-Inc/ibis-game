extends Node2D

class_name Tile

enum TileType {
	LAND,
	LAND2
}

@export var tile_type: TileType
@onready  var sprite := $Sprite2D
