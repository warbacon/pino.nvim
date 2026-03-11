local M = {}

---@return table<string,string>
M.setup = function()
	local opts = require("pino.config").options
	local util = require("pino.util")

	local colors = {
		bedrock = util.oklch(17, 0.025, 290),
		base = util.oklch(21, 0.028, 290),
		surface = util.oklch(25, 0.036, 290),
		overlay = util.oklch(29, 0.043, 290),
		highlight = util.oklch(33, 0.046, 290),

		text = util.oklch(90, 0.025, 290),
		subtle = util.oklch(70, 0.05, 290),
		muted = util.oklch(50, 0.05, 290),

		foam = util.oklch(82, 0.06, 209),
		gold = util.oklch(84, 0.11, 77),
		iris = util.oklch(77, 0.13, 304),
		leaf = util.oklch(77, 0.1, 141),
		love = util.oklch(70, 0.15, 4),
		pine = util.oklch(70, 0.1, 228),
		rose = util.oklch(82, 0.06, 21),
		zest = util.oklch(84, 0.15, 43),
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
		bright_red = util.oklch(76, 0.15, 4),
		bright_green = util.oklch(83, 0.1, 141),
		bright_yellow = util.oklch(90, 0.11, 77),
		bright_blue = util.oklch(76, 0.1, 228),
		bright_magenta = util.oklch(83, 0.13, 304),
		bright_cyan = util.oklch(88, 0.06, 209),
		bright_white = colors.text,
	}

	colors.ui = {
		selection = util.blend(colors.pine, 0.2, colors.surface),
	}

	opts.on_colors(colors)

	return colors
end

return M
