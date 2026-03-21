local M = {}

---@param colors table
function M.generate(colors)
    local content = require("pino.util").template(
        [[
[Palette]
Name=Pino
Foreground=${text}
Background=${base}
CursorForeground=${base}
CursorBackground=${text}
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
        colors
    )

    return {
        { filename = "pino.palette", content = content },
    }
end

return M
