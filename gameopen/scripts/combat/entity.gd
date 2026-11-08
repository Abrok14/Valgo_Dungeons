extends Control

@export var SpriteNode: AnimatedSprite2D
@export var HealthNode:Node
@export var AttackNode:Node

var CurrentTargets:Array

#staty
var Str:int
var Dex:int
var Int:int

#func _ready():
#	entity_sprite.play(idleanimacia tuna)

func LoadEntity(TagetRes):
	Str = TagetRes.Str
	Dex = TagetRes.Dex
	Int = TagetRes.Int
	HealthNode.MaxHP = TagetRes.MaxHP
	HealthNode.CurrentHP = TagetRes.CurrentHP
	
	AttackNode.LoadSkills(TagetRes.Skills)
	HealthNode.Death.connect(Death)

func RecieveDamage(amount, type):
	HealthNode.TakeDamage(amount, type)
	
func Death():
	queue_free()
