module vwin32

pub const wm_paint = u32(0x000f)
pub const wm_close = u32(0x0010)
pub const wm_destroy = u32(0x0002)
pub const wm_lbuttondown = u32(0x0201)
pub const wm_mousemove = u32(0x0200)
pub const wm_mouseleave = u32(0x02a3)
pub const wm_char = u32(0x0102)
pub const wm_timer = u32(0x0113)

pub const ws_overlappedwindow = u32(0x00cf0000)
pub const ws_popup = u32(0x80000000)
pub const ws_thickframe = u32(0x00040000)
pub const ws_minimizebox = u32(0x00020000)
pub const ws_maximizebox = u32(0x00010000)

pub const sw_show = 5
pub const sw_maximize = 3
pub const sw_restore = 9
pub const sw_minimize = 6

pub struct Rect {
pub:
	left int
	top int
	right int
	bottom int
}

pub fn rect(x int, y int, w int, h int) Rect {
	return Rect{x, y, x + w, y + h}
}

pub fn (r Rect) width() int {
	return r.right - r.left
}

pub fn (r Rect) height() int {
	return r.bottom - r.top
}

pub fn (r Rect) contains(x int, y int) bool {
	return x >= r.left && x < r.right && y >= r.top && y < r.bottom
}

pub fn borderless_style() u32 {
	return ws_popup | ws_thickframe | ws_minimizebox | ws_maximizebox
}

pub fn standard_frame_style() u32 {
	return ws_overlappedwindow
}

pub fn style_has_standard_frame(style u32) bool {
	return style & ws_overlappedwindow == ws_overlappedwindow && style & ws_popup == 0
}

pub fn style_has_resize_frame(style u32) bool {
	return style & ws_thickframe != 0
}

pub fn style_has_window_buttons(style u32) bool {
	return style & ws_minimizebox != 0 && style & ws_maximizebox != 0
}

pub fn style_supports_external_transparency_tools(style u32) bool {
	return style_has_standard_frame(style) && style_has_resize_frame(style)
		&& style_has_window_buttons(style)
}
