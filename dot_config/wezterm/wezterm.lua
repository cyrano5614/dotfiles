local wezterm = require("wezterm")
local act = wezterm.action

local function isViProcess(pane)
	-- get_foreground_process_name On Linux, macOS and Windows,
	-- the process can be queried to determine this path. Other operating systems
	-- (notably, FreeBSD and other unix systems) are not currently supported
	return pane:get_foreground_process_name():find("n?vim") ~= nil
	-- return pane:get_title():find("n?vim") ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
	if isViProcess(pane) then
		window:perform_action(
			-- This should match the keybinds you set in Neovim.
			act.SendKey({ key = vim_direction, mods = "CTRL" }),
			pane
		)
	else
		window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
	end
end

wezterm.on("ActivatePaneDirection-right", function(window, pane)
	conditionalActivatePane(window, pane, "Right", "l")
end)
wezterm.on("ActivatePaneDirection-left", function(window, pane)
	conditionalActivatePane(window, pane, "Left", "h")
end)
wezterm.on("ActivatePaneDirection-up", function(window, pane)
	conditionalActivatePane(window, pane, "Up", "k")
end)
wezterm.on("ActivatePaneDirection-down", function(window, pane)
	conditionalActivatePane(window, pane, "Down", "j")
end)
--
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
--
-- -- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

-- function recompute_padding(window)
-- 	local window_dims = window:get_dimensions()
-- 	local overrides = window:get_config_overrides() or {}
--
-- 	if not window_dims.is_full_screen then
-- 		if not overrides.window_padding then
-- 			-- not changing anything
-- 			return
-- 		end
-- 		overrides.window_padding = nil
-- 	else
-- 		-- Use only the middle 33%
-- 		local third = math.floor(window_dims.pixel_width / 3)
-- 		local new_padding = {
-- 			left = third,
-- 			right = third,
-- 			top = 0,
-- 			bottom = 0,
-- 		}
-- 		if overrides.window_padding and new_padding.left == overrides.window_padding.left then
-- 			-- padding is same, avoid triggering further changes
-- 			return
-- 		end
-- 		overrides.window_padding = new_padding
-- 	end
-- 	window:set_config_overrides(overrides)
-- end
--
-- wezterm.on("window-resized", function(window, pane)
-- 	recompute_padding(window)
-- end)
--
-- wezterm.on("window-config-reloaded", function(window)
-- 	recompute_padding(window)
-- end)

local config = {
	check_for_updates = false,
	color_scheme = "Gruvbox Dark",
	window_background_opacity = 0.8,
	inactive_pane_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 0.5,
	},
	-- default_prog = { "/bin/bash", "-l" },
	font_size = 13.0,
	-- window_decorations = "NONE",
	window_decorations = "RESIZE",

	launch_menu = {},
	leader = { key = "b", mods = "CTRL" },
	disable_default_key_bindings = false,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	-- show_tabs_in_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	show_tab_index_in_tab_bar = false,
	enable_tab_bar = false,

	keys = {
		-- { key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
		-- keys = {
		-- 	{ key = "s", mods = "LEADER", action = wezterm.action.ShowTabNavigator },
		-- },
		{ key = "s", mods = "LEADER", action = wezterm.action.ShowTabNavigator },
		{
			key = "k",
			mods = "LEADER",
			action = wezterm.action.SplitPane({ direction = "Up", size = { Percent = 50 } }),
		},
		{
			key = "j",
			mods = "LEADER",
			action = wezterm.action.SplitPane({ direction = "Down", size = { Percent = 50 } }),
		},
		{
			key = "h",
			mods = "LEADER",
			action = wezterm.action.SplitPane({ direction = "Left", size = { Percent = 50 } }),
		},
		{
			key = "l",
			mods = "LEADER",
			action = wezterm.action.SplitPane({ direction = "Right", size = { Percent = 50 } }),
		},
		{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
		{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		-- { key = "h", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		-- { key = "j", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		-- { key = "k", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		-- { key = "l", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "h", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-left") },
		{ key = "j", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-down") },
		{ key = "k", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-up") },
		{ key = "l", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-right") },
		{ key = "H", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
		{ key = "J", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
		{ key = "K", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
		{ key = "L", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
		{ key = "h", mods = "ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },
		{ key = "l", mods = "ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },
		{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
		{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
		{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
		{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
		{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
		{ key = "X", mods = "LEADER", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
		{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
		{ key = "Enter", mods = "CTRL", action = wezterm.action({ SendString = "\x1b[13;5u" }) },
		{ key = "Enter", mods = "SHIFT", action = wezterm.action({ SendString = "\x1b[13;2u" }) },

		-- { key = "n", mods = "SHIFT|CTRL", action = "ToggleFullScreen" },
		-- { key = "v", mods = "SHIFT|CTRL", action = "Paste" },
		-- { key = "c", mods = "SHIFT|CTRL", action = "Copy" },
	},
	set_environment_variables = {},
	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 10,
	},
	tab_bar_style = {
		new_tab = wezterm.format({
			{ Background = { Color = "#0b0022" } },
			{ Foreground = { Color = "#2b2042" } },
			{ Text = SOLID_LEFT_ARROW },
		}),
		-- active_tab_right = wezterm.format({
		-- 	{ Background = { Color = "#0b0022" } },
		-- 	{ Foreground = { Color = "#2b2042" } },
		-- 	{ Text = SOLID_RIGHT_ARROW },
		-- }),
		-- inactive_tab = wezterm.format({
		-- 	{ Background = { Color = "#0b0022" } },
		-- 	{ Foreground = { Color = "#1b1032" } },
		-- 	{ Text = SOLID_LEFT_ARROW },
		-- }),
		-- inactive_tab_right = wezterm.format({
		-- 	{ Background = { Color = "#0b0022" } },
		-- 	{ Foreground = { Color = "#1b1032" } },
		-- 	{ Text = SOLID_RIGHT_ARROW },
		-- }),
	},
	colors = {
		tab_bar = {
			-- The color of the strip that goes along the top of the window
			-- (does not apply when fancy tab bar is in use)
			background = "None",

			-- The active tab is the one that has focus in the window
			active_tab = {
				-- The color of the background area for the tab
				bg_color = "None",
				-- The color of the text for the tab
				fg_color = "#c0c0c0",

				-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
				-- label shown for this tab.
				-- The default is "Normal"
				intensity = "Bold",

				-- Specify whether you want "None", "Single" or "Double" underline for
				-- label shown for this tab.
				-- The default is "None"
				underline = "None",

				-- Specify whether you want the text to be italic (true) or not (false)
				-- for this tab.  The default is false.
				italic = false,

				-- Specify whether you want the text to be rendered with strikethrough (true)
				-- or not for this tab.  The default is false.
				strikethrough = false,
			},

			-- Inactive tabs are the tabs that do not have focus
			inactive_tab = {
				bg_color = "None",
				fg_color = "#808080",

				-- The same options that were listed under the `active_tab` section above
				-- can also be used for `inactive_tab`.
			},

			-- You can configure some alternate styling when the mouse pointer
			-- moves over inactive tabs
			-- inactive_tab_hover = {
			-- 	bg_color = "#3b3052",
			-- 	fg_color = "#909090",
			-- 	italic = true,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab_hover`.
			-- },

			-- The new tab button that let you create new tabs
			-- new_tab = {
			-- 	bg_color = "#1b1032",
			-- 	fg_color = "#808080",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab`.
			-- },

			-- You can configure some alternate styling when the mouse pointer
			-- moves over the new tab button
			-- new_tab_hover = {
			-- 	bg_color = "#3b3052",
			-- 	fg_color = "#909090",
			-- 	italic = true,
			--
			-- 	-- The same options that were listed under the `active_tab` section above
			-- 	-- can also be used for `new_tab_hover`.
			-- },
		},
	},
	-- ssh_domains = {
	-- 	{
	-- 		name = "hamilton.server",
	-- 	},
	-- },
	--
	-- -- This causes `wezterm` to act as though it was started as
	-- -- `wezterm connect unix` by default, connecting to the unix
	-- -- domain on startup.
	-- -- If you prefer to connect manually, leave out this line.
	-- default_gui_startup_args = { "connect", "unix" },
	-- unix_domains = {
	-- 	{
	-- 		name = "unix",
	-- 	},
	-- },
	--
	-- -- This causes `wezterm` to act as though it was started as
	-- -- `wezterm connect unix` by default, connecting to the unix
	-- -- domain on startup.
	-- -- If you prefer to connect manually, leave out this line.
	-- default_gui_startup_args = { "connect", "unix" },
}

return config
