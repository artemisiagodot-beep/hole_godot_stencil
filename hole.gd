extends RigidBody3D
class_name Hole

@onready var cutout_collision: CollisionShape3D = $CutoutCollision
@onready var hole_visual: MeshInstance3D = $HoleVisual
@onready var camera_3d: Camera3D = $Camera3D
@onready var donut: StaticBody3D = $Donut
@onready var activator: Area3D = $Activator
@onready var activator_collider: CollisionShape3D = $Activator/ActivatorCollider


@export var move_force_speed: float = 20

func _physics_process(_delta: float) -> void:
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction := Vector3(input_dir.x, 0, input_dir.y)
	apply_central_force(direction * move_force_speed)


func _on_activator_body_entered(body: Node3D) -> void:
	if body.is_in_group("fallable"):
		body.set_collision_mask_value(1, false)
		print("found body")

func _on_activator_body_exited(body: Node3D) -> void:
	if body.is_in_group("fallable"):
		body.set_collision_mask_value(1, true)
