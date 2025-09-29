extends CharacterBody2D

@onready var sprite = $AnimationPlayer

func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	var dir2 = Input.get_vector("m_l","m_r","m_u","m_d")
	velocity = dir*700 
	move_and_slide()
	sprite.play("joker_idle")
	
	if velocity.length()!=0:
		sprite.play("Joker_walk")
		print("Working")
