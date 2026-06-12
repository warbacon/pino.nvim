local M = {}

---@param palette table
function M.generate(palette)
	local util = require("pino.util")
	local color = require("pino.color")
	local ptyxis_colors = vim.tbl_extend("force", palette, {
		bell_background = color.blend_hex(palette.gold, 0.25, palette.surface),
		superuser_background = color.blend_hex(palette.love, 0.33, palette.base),
		remote_background = color.blend_hex(palette.pine, 0.33, palette.base),
	})

	local content = util.template(
		[[
[Palette]
Name=Pino
Primary=true
Foreground=${text}
Background=${base}
TitlebarForeground=${text}
TitlebarBackground=${surface}
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
