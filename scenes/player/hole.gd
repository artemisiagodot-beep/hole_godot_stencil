extends RigidBody3D
class_name Hole

@onready var camera_3d: Camera3D = $Camera3D



@onready var donut: StaticBody3D = $Donut
@onready var floor_donut_stopper: StaticBody3D = $FloorDonutStopper
@onready var inside_collider: StaticBody3D = $InsideCollider

@onready var activator: Area3D = $Activator
@onready var unfreeze: Area3D = $Unfreeze
@onready var activator_collider: CollisionShape3D = $Activator/ActivatorCollider
@onready var cutout_collision: CollisionShape3D = $CutoutCollision

@onready var hole_visual: MeshInstance3D = $HoleVisual


@export var game_system: GameSystem
@export var move_force_speed: float = 20
var base_size = 1.0

func _ready() -> void:
	freeze = true
	unfreeze.monitoring = false


func _physics_process(_delta: float) -> void:
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	if !input_dir.is_zero_approx():
		if game_system.player_moved == true:
			pass
		else:
			freeze = false
			unfreeze.monitoring = true
			game_system.player_moved = true
	var direction := Vector3(input_dir.x, 0, input_dir.y)
	apply_central_force(direction * move_force_speed)

func increase_size() -> void:
	base_size += 0.2
	var base_size_vector = Vector3(base_size,base_size,base_size)
	hole_visual.scale = base_size_vector
	donut.scale = base_size_vector
	floor_donut_stopper.scale = base_size_vector
	inside_collider.scale = base_size_vector
	cutout_collision.shape.radius = 0.5 * base_size
	activator_collider.shape.radius = 0.5 * base_size
	
func _on_activator_body_entered(body: Node3D) -> void:
	if body.is_in_group("fallable"):
		body.set_collision_mask_value(1, false)

func _on_activator_body_exited(body: Node3D) -> void:
	if body.is_in_group("fallable"):
		body.set_collision_mask_value(1, true)


func _on_unfreeze_body_entered(body: Node3D) -> void:
	if body.is_in_group("fallable"):
		body.freeze = false
