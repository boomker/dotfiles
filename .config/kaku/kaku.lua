local wezterm = require("wezterm")

local function resolve_bundled_config()
	local resource_dir = wezterm.executable_dir:gsub("MacOS/?$", "Resources")
	local bundled = resource_dir .. "/kaku.lua"
	local f = io.open(bundled, "r")
	if f then
		f:close()
		return bundled
	end

	local dev_bundled = wezterm.executable_dir .. "/../../assets/macos/Kaku.app/Contents/Resources/kaku.lua"
	f = io.open(dev_bundled, "r")
	if f then
		f:close()
		return dev_bundled
	end

	local app_bundled = "/Applications/Kaku.app/Contents/Resources/kaku.lua"
	f = io.open(app_bundled, "r")
	if f then
		f:close()
		return app_bundled
	end

	local home = os.getenv("HOME") or ""
	local home_bundled = home .. "/Applications/Kaku.app/Contents/Resources/kaku.lua"
	f = io.open(home_bundled, "r")
	if f then
		f:close()
		return home_bundled
	end

	return nil
end

local config = {}
local bundled = resolve_bundled_config()

if bundled then
	local ok, loaded = pcall(dofile, bundled)
	if ok and type(loaded) == "table" then
		config = loaded
	else
		wezterm.log_error("Kaku: failed to load bundled defaults from " .. bundled)
	end
else
	wezterm.log_error("Kaku: bundled defaults not found")
end

-- User overrides:
-- Kaku intentionally keeps WezTerm-compatible Lua API names
-- for maximum compatibility, so `wezterm.*` here is expected.
--
config.line_height = 1.0
-- 1) Font family and size
config.font_size = 16.0
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }
config.font = wezterm.font({ family = "Maple Mono NF CN" })
config.font = wezterm.font_with_fallback({ "JetBrains Maple Mono", "MiSans", "MiSans L3", "LXGWNeoXiHei" })
-- 针对不同语言的字体规则
config.font_rules = {
	-- 斜体
	{
		italic = true,
		font = wezterm.font({
			family = "JetBrains Maple Mono",
			style = "Italic",
		}),
	},
	-- 粗体
	{
		intensity = "Bold",
		font = wezterm.font({
			family = "JetBrains Maple Mono",
			weight = "Bold",
		}),
	},
	-- 粗斜体
	{
		italic = true,
		intensity = "Bold",
		font = wezterm.font({
			family = "JetBrains Maple Mono",
			weight = "Bold",
			style = "Italic",
		}),
	},
}
--
-- 2) Color scheme
config.color_scheme = "Catppuccin Frappe"
--
-- 3) Window size and padding
-- config.initial_cols = 120
-- config.initial_rows = 30
-- config.window_padding = { left = '24px', right = '24px', top = '40px', bottom = '20px' }
--
-- 4) Default shell/program
-- config.default_prog = { '/bin/zsh', '-l' }
config.default_prog = { "/opt/homebrew/bin/zsh", "-l", "-c", "tmux new-session -A -D -s  🚀" }
--
-- 5) Cursor and scrollback
-- config.default_cursor_style = 'BlinkingBar'
-- config.scrollback_lines = 20000
--
-- 6) Add or override a key binding
-- config.leader = { key = "g", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	{ key = "m", mods = "CMD", action = wezterm.action.DisableDefaultAssignment },
	{
		key = "m",
		mods = "CMD",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "M" }),
		}),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "w" }),
		}),
	},
	{
		key = "p",
		mods = "CMD",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "P" }),
		}),
	},
	{
		key = "b",
		mods = "CMD",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "b", mods = "OPT" }),
		}),
	},
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "d", mods = "OPT" }),
		}),
	},
	{
		key = "e",
		mods = "CMD",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "f", mods = "OPT" }),
		}),
	},
	{
		key = "UpArrow",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "K" }),
		}),
	},
	{
		key = "DownArrow",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "J" }),
		}),
	},
	{
		key = "LeftArrow",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "H" }),
		}),
	},
	{
		key = "RightArrow",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "L" }),
		}),
	},
	{
		key = "n",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "n" }),
		}),
	},
	{
		key = "b",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "b" }),
		}),
	},
	{
		key = "u",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "u" }),
		}),
	},
	{
		key = "o",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "o" }),
		}),
	},
	{
		key = "z",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "z" }),
		}),
	},
	{
		key = "t",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "t" }),
		}),
	},
	{
		key = "s",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "-" }),
		}),
	},
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "|" }),
		}),
	},
	{
		key = "e",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "E" }),
		}),
	},
	{
		key = "r",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "r" }),
		}),
	},
	{
		key = "j",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "j" }),
		}),
	},
	{
		key = "k",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "k" }),
		}),
	},
	{
		key = "h",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "h" }),
		}),
	},
	{
		key = "l",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "l" }),
		}),
	},
	{
		key = "y",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "c" }),
		}),
	},
	{
		key = "g",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "g" }),
		}),
	},
	{
		key = "f",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "F" }),
		}),
	},
	{
		key = "m",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "m" }),
		}),
	},
	{
		key = "w",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "&" }),
		}),
	},
	{
		key = "x",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "x" }),
		}),
	},
	{
		key = "v",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "c" }),
			wezterm.action.SendKey({ key = "?" }),
		}),
	},
	{
		key = "c",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = ":" }),
		}),
	},
	{
		key = ",",
		mods = "CMD|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "g", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "," }),
		}),
	},
	{
		key = "i",
		mods = "CMD|SHIFT",
		action = wezterm.action.QuickSelect,
	},
	{
		key = "p",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivateCommandPalette,
	},
}

config.mouse_bindings = {
	{
		mods = "CMD",
		event = { Up = { streak = 1, button = "Left" } },
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

config.selection_word_boundary = "{}[]()|/\"'`.,;: "

return config
