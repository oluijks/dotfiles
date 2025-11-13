local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config = {
	enable_wayland = false,
	term = "xterm-kitty",
	enable_kitty_graphics = true,
	max_fps = 120,
	animation_fps = 30,
	send_composed_key_when_left_alt_is_pressed = true,
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 12,
	line_height = 1.1,
	enable_tab_bar = false,
	use_resize_increments = true,
	window_close_confirmation = "NeverPrompt",
	default_cursor_style = "SteadyBlock",
	cursor_blink_ease_out = "Constant",
	cursor_blink_ease_in = "Constant",
	cursor_blink_rate = 0,
	window_padding = {
		left = 25,
		right = 25,
		top = 25,
		bottom = 25,
	},
	-- yeah, I like CTRL+v
	keys = {
		{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	},
	warn_about_missing_glyphs = false,
	window_background_opacity = 0.9,
	color_scheme = "gruvbox_material_dark_hard",
	color_schemes = {
		["gruvbox_material_dark_hard"] = {
			foreground = "#D4BE98",
			background = "#1D2021",
			cursor_bg = "#D4BE98",
			cursor_border = "#D4BE98",
			cursor_fg = "#1D2021",
			selection_bg = "#D4BE98",
			selection_fg = "#3C3836",

			ansi = { "#1d2021", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
			brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
		},
		["gruvbox_material_dark_medium"] = {},
		["gruvbox_material_dark_soft"] = {},
		["gruvbox_material_light_hard"] = {
			foreground = "#654735",
			background = "#F9F5D7",
			cursor_bg = "#654735",
			cursor_border = "#654735",
			cursor_fg = "#F9F5D7",
			selection_bg = "#F3EAC7",
			selection_fg = "#4F3829",

			ansi = { "#1d2021", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
			brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
		},
		["gruvbox_material_light_medium"] = {},
		["gruvbox_material_light_soft"] = {},
	},
}

return config
