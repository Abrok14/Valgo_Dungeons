extends Control

var PlayerEntity
var EnemyEntity

const ENTITY = preload("uid://bdqqbn4wov1qr")
const SKELETON = preload("uid://da3ivrrl7f1ag")
 
func _ready():
	PlayerEntity = ENTITY.instantiate()
	add_child(PlayerEntity)
	PlayerEntity.LoadEntity(PlayerStats)
	
	EnemyEntity = ENTITY.instantiate()
	add_child(EnemyEntity)
	EnemyEntity.LoadEntity(SKELETON)
