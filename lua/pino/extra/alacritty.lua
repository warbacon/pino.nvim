local M = {}

--- @param colors table
function M.generate(colors)
	local content = require("pino.util").template(
		[[
[colors.primary]
background = "${base}"
foreground = "${text}"
dim_foreground = "${subtle}"

[colors.search.matches]
foreground = "${base}"
background = "${gold}"

[colors.search.focused_match]
foreground = "${base}"
background = "${zest}"

[colors.hints.start]
foreground = "${base}"
background = "${gold}"

[colors.hints.end]
foreground = "${base}"
background = "${pine}"

[colors.footer_bar]
foreground = "${text}"
background = "${surface}"

[colors.selection]
text = "CellForeground"
background = "${ui.selection}"

[colors.normal]
black = "${terminal.black}"
red = "${terminal.red}"
green = "${terminal.green}"
yellow = "${terminal.yellow}"
blue = "${terminal.blue}"
magenta = "${terminal.magenta}"
cyan = "${terminal.cyan}"
white = "${terminal.white}"

[colors.bright]
black = "${terminal.bright_black}"
red = "${terminal.bright_red}"
green = "${terminal.bright_green}"
yellow = "${terminal.bright_yellow}"
blue = "${terminal.bright_blue}"
magenta = "${terminal.bright_magenta}"
cyan = "${terminal.bright_cyan}"
white = "${terminal.bright_white}"
]],
		colors
	)

	return {
		{ filename = "pino.toml", content = content },
	}
end

return M
