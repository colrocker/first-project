extends RigidBody2D

@onready var Sprite: Sprite2D = $Icon

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_drop_of_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Rigidbody"): 
		print ("enterd")


func _on_drop_of_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("Rigidbody"):
		print ("left")
