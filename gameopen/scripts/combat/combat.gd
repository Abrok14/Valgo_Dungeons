extends Control

var PlayerEntity
var EnemyEntity
@onready var player_skill_box = $PlayerSkillBox


const ENTITY = preload("uid://bdqqbn4wov1qr")
const SKELETON = preload("uid://da3ivrrl7f1ag")
 
func _ready():
	PlayerEntity = ENTITY.instantiate()
	add_child(PlayerEntity)
	PlayerEntity.LoadEntity(PlayerStats)
	PlayerEntity.position = Vector2(200,300)
	player_skill_box.initiate(PlayerEntity)
	
	EnemyEntity = ENTITY.instantiate()
	add_child(EnemyEntity)
	EnemyEntity.LoadEntity(SKELETON)
	EnemyEntity.position = Vector2(900,300)
