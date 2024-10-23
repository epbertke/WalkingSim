extends CharacterBody3D
@export var speed = 10

var rotation_speed: float = 0.1
var pitch: float = 0.0

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("w"):
		velocity = -get_global_transform().basis.z * speed
		move_and_slide()
		
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		# Get the mouse movement delta
		var mouse_delta = event.relative
		# Rotate the player around the y-axis
		rotate_y(deg_to_rad(-mouse_delta.x * rotation_speed))
		# Update the pitch, clamping it
		pitch = clamp(pitch - mouse_delta.y * rotation_speed, -45.0, 45.0)
		# Set the rotation for the x-axis (pitch)
		rotation_degrees.x = pitch

func _on_alert_zone_body_entered(body: Node3D) -> void:
	$"../AlertZone/Label3D".visible = true
	$"../AlertZone".playerInside = true

func _on_alert_zone_body_exited(body: Node3D) -> void:
	$"../AlertZone/Label3D".visible = false
	$"../AlertZone".playerInside = false
