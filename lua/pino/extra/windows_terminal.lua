local M = {}

--- @param colors table
function M.generate(colors)
	local colorscheme = require("pino.util").template(
		[[
{
    "name": "Pino",
    "background": "${base}",
    "foreground": "${text}",
    "cursorColor": "${text}",
    "selectionBackground": "${ui.selection}",
    "black": "${terminal.black}",
    "red": "${terminal.red}",
    "green": "${terminal.green}",
    "yellow": "${terminal.yellow}",
    "blue": "${terminal.blue}",
    "purple": "${terminal.magenta}",
    "cyan": "${terminal.cyan}",
    "white": "${terminal.white}",
    "brightBlack": "${terminal.bright_black}",
    "brightRed": "${terminal.bright_red}",
    "brightGreen": "${terminal.bright_green}",
    "brightYellow": "${terminal.bright_yellow}",
    "brightBlue": "${terminal.bright_blue}",
    "brightPurple": "${terminal.bright_magenta}",
    "brightCyan": "${terminal.bright_cyan}",
    "brightWhite": "${terminal.bright_white}"
}
]],
		colors
	)

	local theme = require("pino.util").template(
		[[
{
    "name": "Pino",
    "tab": {
        "background": "terminalBackground",
        "unfocusedBackground": "#00000000"
    },
    "tabRow": {
        "background": "${bedrock}",
        "unfocusedBackground": "${overlay}"
    },
    "window": {
        "frame": "${pine}",
        "unfocusedFrame": "${highlight}"
    }
}
]],
		colors
	)

	return {
		{ filename = "pino-colorscheme.json", content = colorscheme },
		{ filename = "pino-theme.json", content = theme },
	}
end

return M
