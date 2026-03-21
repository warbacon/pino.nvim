local M = {}

---@param colors table
function M.generate(colors)
	local util = require("pino.util")
	local ptyxis_colors = vim.tbl_extend("force", colors, {
		bell_background = util.blend(colors.gold, 0.25, colors.bedrock),
		superuser_background = util.blend(colors.love, 0.33, colors.base),
		remote_background = util.blend(colors.pine, 0.33, colors.base),
	})

	local content = require("pino.util").template(
		[[
[Palette]
Name=Pino
Primary=true
Foreground=${text}
Background=${base}
TitlebarForeground=${text}
TitlebarBackground=${bedrock}
Cursor=${text}
CursorForeground=${base}
CursorBackground=${text}
BellForeground=${text}
BellBackground=${bell_background}
SuperuserForeground=${text}
SuperuserBackground=${superuser_background}
RemoteForeground=${text}
RemoteBackground=${remote_background}
Color0=${terminal.black}
Color1=${terminal.red}
Color2=${terminal.green}
Color3=${terminal.yellow}
Color4=${terminal.blue}
Color5=${terminal.magenta}
Color6=${terminal.cyan}
Color7=${terminal.white}
Color8=${terminal.bright_black}
Color9=${terminal.bright_red}
Color10=${terminal.bright_green}
Color11=${terminal.bright_yellow}
Color12=${terminal.bright_blue}
Color13=${terminal.bright_magenta}
Color14=${terminal.bright_cyan}
Color15=${terminal.bright_white}
]],
		ptyxis_colors
	)

	return {
		{ filename = "pino.palette", content = content },
	}
end

return M
