extends Node2D

@onready var groundLayer := $Map/GroundLayer
@onready var barrierLayer := $Map/Barriers

@export var GroundTileData = {}

var VOID := Vector2i(0,2)
var NULLAFFINITY := Vector2i(12,2)

func place_initial_void(power :int) -> void:
	var min = - power
	for y in range(-power, power):
		for x in range(-power, power):
			GroundTileData[str(Vector2i(x,y))] = {}
			GroundTileData[str(Vector2i(x,y))]["tile"] = NULLAFFINITY
			groundLayer.set_cell(Vector2(x,y), 0, NULLAFFINITY)
	#Place Void barrier
	for x in range(-power-1, power+1):
		GroundTileData[str(Vector2i(x,power))] = {}
		GroundTileData[str(Vector2i(x,power))]["tile"] = VOID
		groundLayer.set_cell(Vector2(x,power), 0, VOID)
		GroundTileData[str(Vector2i(x,-power-1))] = {}
		GroundTileData[str(Vector2i(x,-power-1))]["tile"] = VOID
		groundLayer.set_cell(Vector2(x,-power-1), 0, VOID)
	for y in range(-power, power):
		GroundTileData[str(Vector2i(power,y))] = {}
		GroundTileData[str(Vector2i(power,y))]["tile"] = VOID
		groundLayer.set_cell(Vector2(power,y), 0, VOID)
		GroundTileData[str(Vector2i(-power-1,y))] = {}
		GroundTileData[str(Vector2i(-power-1,y))]["tile"] = VOID
		groundLayer.set_cell(Vector2(-power-1,y), 0, VOID)

func _ready():
	place_initial_void(5)
