extends Camera2D

# Variables to store the initial mouse position, camera position, and zoom level
var initial_mouse_pos: Vector2 = Vector2()
var initial_camera_pos: Vector2 = Vector2()

# Flag to check if the mouse is currently dragging
var dragging: bool = false

# Zoom limits
var min_zoom: float = 0.5
var max_zoom: float = 2.0
var initial_zoom: float = 1.0




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print("Hello")




func _input(event):
	
	if event is InputEventMouseButton:

		if event.button_index == MOUSE_BUTTON_LEFT:

			if event.pressed:
				start_drag(event.position)
			else:
				stop_drag()

		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom_in()

		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom_out()

	elif event is InputEventMouseMotion and dragging:
		update_drag(event.position)




func start_drag(mouse_pos):
	# Set the initial mouse, camera, and zoom positions
	initial_mouse_pos = mouse_pos
#	initial_camera_pos = camera_node.global_position
	# initial_zoom = camera_node.zoom
	dragging = true
	print("Hello")




func stop_drag():
	# Reset the dragging flag
	dragging = false




func update_drag(mouse_pos):
	# Calculate the mouse movement
	var delta = mouse_pos - initial_mouse_pos

	# Update the camera position based on the mouse movement
#	camera_node.global_position = initial_camera_pos - delta




func zoom_in():
	# Zoom in while respecting the max_zoom limit
#	if camera_node.zoom.x < 5:
#			camera_node.zoom = camera_node.zoom.lerp(camera_node.zoom + Vector2(0.1, 0.1), t)
#	print(camera_node.zoom)




func zoom_out():
	# Zoom out while respecting the min_zoom limit
#	if camera_node.zoom.x > 0.1:
#		camera_node.zoom = camera_node.zoom.lerp(camera_node.zoom - Vector2(0.1, 0.1), t)
