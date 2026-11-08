extends Control

@export var SpriteNode: AnimatedSprite2D
@export var HealthNode:Node
@export var AttackNode:Node
@onready var health_bar = $HealthBar

var CurrentTargets:Array

#staty
var Str:int
var Dex:int
var Int:int

const SPRITE_SCALE := Vector2(3, 3)

func _process(delta):
	health_bar.value = HealthNode.CurrentHP/HealthNode.MaxHP

func LoadEntity(TagetRes):
	Str = TagetRes.Str
	Dex = TagetRes.Dex
	Int = TagetRes.Int
	HealthNode.MaxHP = TagetRes.MaxHP
	HealthNode.CurrentHP = TagetRes.MaxHP
	AttackNode.LoadSkills(TagetRes.Skills)
	HealthNode.Death.connect(Death)
	LoadVisuals(TagetRes)


func LoadVisuals(TagetRes):
	if TagetRes.Frames:
		# Animated entity (player now, skeleton later)
		SpriteNode.sprite_frames = TagetRes.Frames
		SpriteNode.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		SpriteNode.scale = SPRITE_SCALE
		SpriteNode.play("idle")
	elif TagetRes.Picture:
		# Still picture (skeleton for now)
		SpriteNode.hide()
		var Pic := Sprite2D.new()
		Pic.texture = TagetRes.Picture
		Pic.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		Pic.scale = SPRITE_SCALE
		add_child(Pic)

func RecieveDamage(amount, type):
	HealthNode.TakeDamage(amount, type)
	
func Death():
	queue_free()
