local M = {}

local OKLCH_BASE = {
	bedrock = "oklch(0.1700 0.0250 290.0)",
	base = "oklch(0.2100 0.0280 290.0)",
	surface = "oklch(0.2500 0.0360 290.0)",
	overlay = "oklch(0.2900 0.0430 290.0)",
	highlight = "oklch(0.3300 0.0460 290.0)",
	text = "oklch(0.8500 0.0250 290.0)",
	subtle = "oklch(0.6500 0.0500 290.0)",
	muted = "oklch(0.5000 0.0500 290.0)",
	foam = "oklch(0.8200 0.0600 209.0)",
	gold = "oklch(0.8400 0.1100 77.0)",
	iris = "oklch(0.7700 0.1100 304.0)",
	leaf = "oklch(0.7700 0.1000 141.0)",
	love = "oklch(0.7000 0.1500 4.0)",
	pine = "oklch(0.7000 0.1000 228.0)",
	rose = "oklch(0.8200 0.0600 21.0)",
	zest = "oklch(0.8400 0.1500 43.0)"
}

local function build_oklch_palette(util)
	local colors = vim.deepcopy(OKLCH_BASE)
	
	colors.terminal = {
		black = colors.overlay,
		red = colors.love,
		green = colors.leaf,
		yellow = colors.gold,
		blue = colors.pine,
		magenta = colors.iris,
		cyan = colors.foam,
		white = colors.subtle,
		bright_black = colors.muted,
		bright_red = "oklch(0.7600 0.1500 4.0)",
		bright_green = "oklch(0.8300 0.1000 141.0)",
		bright_yellow = "oklch(0.9000 0.1100 77.0)",
		bright_blue = "oklch(0.7600 0.1000 228.0)",
		bright_magenta = "oklch(0.8300 0.1300 304.0)",
		bright_cyan = "oklch(0.8800 0.0600 209.0)",
		bright_white = colors.text
	}
	
	colors.ui = { selection = util.blend_oklch(colors.pine, 0.2, colors.surface) }
	
	return colors
end

local function to_hex_palette(value, util)
	if type(value) == "table" then
		local out = {}
		for k, v in pairs(value) do
			out[k] = to_hex_palette(v, util)
		end
		return out
	end
	
	if type(value) == "string" then
		return util.oklch_to_hex(value)
	end
	
	return value
end

---@return table<string, string>
M.setup = function ()
	local opts = require("pino.config").options
	local util = require("pino.util")
	
	local oklch = build_oklch_palette(util)
	local colors = to_hex_palette(oklch, util)
	
	colors.oklch = oklch
	
	opts.on_colors(colors)
	
	return colors
end

return M
