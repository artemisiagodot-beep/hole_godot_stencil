extends RigidBody3D
@export var value_of_object : int = 1
	
func _on_centre_of_object_area_entered(area: Area3D) -> void:
	if area.is_in_group("Below_Surface_Collector"):
		queue_free()
