extends Node

var MaxHP:float = 100
var CurentHP:float
var Str:int = 10
var Dex:int = 4
var Int:int = 3

var Skills:Array[Resource]

var Experience:int
var Level:int

func _ready():
	for skill in ["res://resources/skills/Attack.tres","res://resources/skills/HeavyAttack.tres"]:
		var CurentSkill = load(skill)
		Skills.append(CurentSkill)
