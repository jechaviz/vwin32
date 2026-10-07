module vwin32

fn test_rect_geometry() {
	r := rect(10, 20, 100, 50)
	assert r.width() == 100
	assert r.height() == 50
	assert r.contains(10, 20)
	assert !r.contains(110, 70)
}

fn test_standard_style_contract() {
	style := standard_frame_style()
	assert style_has_standard_frame(style)
	assert style_has_resize_frame(style)
	assert style_has_window_buttons(style)
}
