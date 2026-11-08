extends Node

var Skills:Array = []
var Cooldowns:Array = []

func Attack(skill	):
	var Targets = get_parent().CurrentTargets
	var Damage = CalculateDamage(skill)
	for target in Targets:
		target.RecieveDamage(Damage, skill.SkillType)
	RefreshCooldowns()

func CalculateDamage(skill):
	var Damage = get_parent().get(skill.SkillType) 
	Damage *= skill.SkillPower

func LoadSkills(skills):
	for skill in skills:
		Skills.append(skill)
		Cooldowns.append(skill.SkillCooldown)

func RefreshCooldowns():
	for cooldown in Cooldowns:
		cooldown = max(cooldown-1,0)
