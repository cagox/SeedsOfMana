extends CharacterBody2D


var movement_speed : float = 60.0
var character_direection : Vector2

enum States {
	IDLE,
	Move
}

var currentState = States.IDLE
