local M = {}

local function oklch(l, c, h)
	return {
		l = l,
		c = c,
		h = h,
	}
end

local function build_palette()
	local color = require("pino.color")

	local palette = {
		oklch = {
			bedrock = oklch(0.1700, 0.0250, 290.0),
			base = oklch(0.2100, 0.0280, 290.0),
			surface = oklch(0.2500, 0.0360, 290.0),
			overlay = oklch(0.2900, 0.0430, 290.0),
			highlight = oklch(0.3300, 0.0460, 290.0),
			text = oklch(0.8500, 0.0250, 290.0),
			subtle = oklch(0.6500, 0.0500, 290.0),
			muted = oklch(0.5000, 0.0500, 290.0),
			foam = oklch(0.8200, 0.0600, 209.0),
			gold = oklch(0.8400, 0.1100, 77.0),
			iris = oklch(0.7700, 0.1100, 304.0),
			leaf = oklch(0.7700, 0.1000, 141.0),
			love = oklch(0.7000, 0.1500, 4.0),
			pine = oklch(0.7000, 0.1000, 228.0),
			rose = oklch(0.8200, 0.0600, 21.0),
			zest = oklch(0.8400, 0.1500, 43.0),
		},
	}

	palette.oklch.terminal = {
		black = palette.oklch.overlay,
		red = palette.oklch.love,
		green = palette.oklch.leaf,
		yellow = palette.oklch.gold,
		blue = palette.oklch.pine,
		magenta = palette.oklch.iris,
		cyan = palette.oklch.foam,
		white = palette.oklch.subtle,
		bright_black = palette.oklch.muted,
		bright_red = oklch(0.7600, 0.1500, 4.0),
		bright_green = oklch(0.8300, 0.1000, 141.0),
		bright_yellow = oklch(0.9000, 0.1100, 77.0),
		bright_blue = oklch(0.7600, 0.1000, 228.0),
		bright_magenta = oklch(0.8300, 0.1300, 304.0),
		bright_cyan = oklch(0.8800, 0.0600, 209.0),
		bright_white = palette.oklch.text,
	}

	palette.oklch.ui = {
		selection = color.hex_to_oklch(color.blend(palette.oklch.pine, 0.2, palette.oklch.surface)),
	}

	palette.hex = color.oklch_tree_to_hex(palette.oklch)

	for key, value in pairs(palette.hex) do
		if type(value) ~= "table" then
			palette[key] = value
		end
	end

	palette.terminal = palette.hex.terminal
	palette.ui = palette.hex.ui

	return palette
end

---@return table<string, any>
M.setup = function()
	local opts = require("pino.config").options
	local palette = build_palette()

	if opts.on_palette then
		opts.on_palette(palette)
	end

	return palette
end

return M
