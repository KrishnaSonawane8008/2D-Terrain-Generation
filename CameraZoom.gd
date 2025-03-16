extends Camera2D

var _target_zoom= 0.5
const MIN_ZOOM: float=0.5
const MAX_ZOOM: float=15
const ZOOM_INCREMENT: float=0.5
const ZOOM_RATE: float=10

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		if event.button_mask==MOUSE_BUTTON_MASK_MIDDLE:
			position-=event.relative/zoom 
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index==MOUSE_BUTTON_WHEEL_UP:
				zoom_out()
			if event.button_index==MOUSE_BUTTON_WHEEL_DOWN:
				zoom_in()

func zoom_in():
	_target_zoom=max(_target_zoom-ZOOM_INCREMENT,MIN_ZOOM)
	set_physics_process(true)
func zoom_out():
	_target_zoom=min(_target_zoom+ZOOM_INCREMENT,MAX_ZOOM)
	set_physics_process(true)

func _physics_process(delta):
	zoom=lerp(zoom,_target_zoom*Vector2.ONE,ZOOM_RATE*delta)
	set_physics_process(not is_equal_approx(zoom.x,_target_zoom))
		
