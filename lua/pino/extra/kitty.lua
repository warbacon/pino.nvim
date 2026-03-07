local M = {}

--- @param colors table
function M.generate(colors)
    local content = require("pino.util").template(
        [[
foreground ${text}
background ${base}
selection_foreground none
selection_background ${ui.selection}
cursor ${text}
cursor_text_color ${base}

# Black
color0 ${terminal.black}
color8 ${terminal.bright_black}

# Red
color1 ${terminal.red}
color9 ${terminal.bright_red}

# Green
color2 ${terminal.green}
color10 ${terminal.bright_green}

# Yellow
color3 ${terminal.yellow}
color11 ${terminal.bright_yellow}

# Blue
color4 ${terminal.blue}
color12 ${terminal.bright_blue}

# Magenta
color5 ${terminal.magenta}
color13 ${terminal.bright_magenta}

# Cyan
color6 ${terminal.cyan}
color14 ${terminal.bright_cyan}

# White
color7 ${terminal.white}
color15 ${terminal.bright_white}
]],
        colors
    )

    return {
        { filename = "pino.conf", content = content },
    }
end

return M
