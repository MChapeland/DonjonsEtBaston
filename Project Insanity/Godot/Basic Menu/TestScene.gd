extends Node2D



# Camera node
@onready var camera_node: Camera2D = $Camera2D

# Variables to store the mouse and camera positions
var initial_mouse_pos: Vector2 = Vector2()
var initial_camera_pos: Vector2 = Vector2()
var aimed_camera_pos: Vector2 = Vector2()

# Zoom variables
var min_zoom: float = 0.4
var max_zoom: float = 4.0
var current_zoom: float = 1.0
var zoom_speed: float = 0.2

# Flag to check if the mouse is currently dragging
var dragging: bool = false




func _process(delta):
	camera_node.zoom = camera_node.zoom.lerp(Vector2(current_zoom, current_zoom), 10 * delta)

	if current_zoom < min_zoom:
		current_zoom = min_zoom

	elif current_zoom > max_zoom:
		current_zoom = max_zoom



func _input(event):
	if event is InputEventMouseButton:

		if event.button_index == MOUSE_BUTTON_LEFT:

			if event.pressed:
				start_drag(event.position)

			else:
				stop_drag()

		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom(zoom_speed)

		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom(-zoom_speed)

	elif event is InputEventMouseMotion and dragging:
		update_drag(event.position)



func start_drag(mouse_pos):
	# Set the initial mouse, camera, and zoom positions
	initial_mouse_pos = mouse_pos
	initial_camera_pos = camera_node.global_position
	# initial_zoom = camera_node.zoom
	dragging = true



func stop_drag():
	# Reset the dragging flag
	dragging = false



func update_drag(mouse_pos):
	# Calculate the mouse movement
	var delta = (mouse_pos - initial_mouse_pos) / camera_node.zoom

	# Update the camera position based on the mouse movement
	camera_node.global_position = initial_camera_pos - delta



func zoom(zoom_value):
	# Zoom in while respecting the max_zoom limit
	if current_zoom <= max_zoom && current_zoom >= min_zoom:
		current_zoom = current_zoom + zoom_value
