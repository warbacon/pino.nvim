local M = {}

---@return table<string,string>
M.setup = function()
	local opts = require("pino.config").options
	local util = require("pino.util")

	local colors = {
		bedrock = util.oklch(17.35, 0.023, 291),
		base = util.oklch(21.35, 0.025, 291),
		surface = util.oklch(25.35, 0.035, 291),
		overlay = util.oklch(29.35, 0.044, 291),
		highlight = util.oklch(33.35, 0.052, 291),

		text = util.oklch(85, 0.035, 291),
		subtle = util.oklch(65, 0.053, 291),
		muted = util.oklch(50, 0.052, 291),

		foam = util.oklch(82.19, 0.0543, 209.56),
		gold = util.oklch(84.29, 0.11, 77),
		iris = util.oklch(77.6, 0.0945, 304.99),
		leaf = util.oklch(77.66, 0.0952, 141.53),
		love = util.oklch(69.77, 0.1565, 4.22),
		pine = util.oklch(70, 0.0926, 228),
		rose = util.oklch(83.63, 0.0544, 21.14),
		zest = util.oklch(85, 0.15, 45),
	}

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
		bright_red = util.oklch(75.77, 0.1565, 4.22),
		bright_green = util.oklch(83.66, 0.0952, 141.53),
		bright_yellow = util.oklch(90.29, 0.11, 77),
		bright_blue = util.oklch(76, 0.0926, 228),
		bright_magenta = util.oklch(83.6, 0.0945, 304.99),
		bright_cyan = util.oklch(88.19, 0.0543, 209.56),
		bright_white = colors.text,
	}

	colors.ui = {
		selection = util.blend(colors.pine, 0.25, colors.surface),
	}

	opts.on_colors(colors)

	return colors
end

return M
