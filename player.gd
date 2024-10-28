extends CharacterBody2D

const SPEED = 300.0
const ACCELERATION = 0.25
const MAX_HEALTH = 100

var health = MAX_HEALTH


func _physics_process(delta: float) -> void:

    # Get the input direction and handle the movement/deceleration.
    # As good practice, you should replace UI actions with custom gameplay actions.
    var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
    if direction:
        # velocity = direction * SPEED
        velocity = lerp(velocity, direction * SPEED, ACCELERATION)
    else:
        # velocity.x = move_toward(velocity.x, 0, SPEED)
        # velocity.y = move_toward(velocity.y, 0, SPEED)
        velocity = lerp(velocity, Vector2.ZERO, ACCELERATION)

    move_and_slide()
