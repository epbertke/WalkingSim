extends Area3D
var playerInside: bool


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label3D.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if playerInside:
		if Input.is_action_just_pressed("Interact"):
			$AudioStreamPlayer3D.playing = true
	else:
		$AudioStreamPlayer3D.playing = false
