local M = {}

--- @param colors table
function M.generate(colors)
    local content = require("pino.util").template(
        [[
background = ${base}
foreground = ${text}
cursor-color = ${text}
cursor-text = ${base}
selection-background = ${ui.selection}
selection-foreground = cell-foreground

# Black
palette = 0=${terminal.black}
palette = 8=${terminal.bright_black}

# Red
palette = 1=${terminal.red}
palette = 9=${terminal.bright_red}

# Green
palette = 2=${terminal.green}
palette = 10=${terminal.bright_green}

# Yellow
palette = 3=${terminal.yellow}
palette = 11=${terminal.bright_yellow}

# Blue
palette = 4=${terminal.blue}
palette = 12=${terminal.bright_blue}

# Magenta
palette = 5=${terminal.magenta}
palette = 13=${terminal.bright_magenta}

# Cyan
palette = 6=${terminal.cyan}
palette = 14=${terminal.bright_cyan}

# White
palette = 7=${terminal.white}
palette = 15=${terminal.bright_white}
]],
        colors
    )

    return {
        { filename = "pino", content = content },
    }
end

return M
