local M = {}

local util = require("pino.util")

local template = [[
foreground ${text}
background ${base}
selection_foreground none
selection_background ${ui.selection}
cursor ${text}
cursor_text_color ${base}
active_tab_background ${pine}
active_tab_foreground ${base}
inactive_tab_background ${overlay}
inactive_tab_foreground ${text}

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
]]

---@param colors table
function M.generate(colors)
	local legacy_content = util.template(template, colors)
	local oklch_source = colors.oklch or colors
	local oklch_content = util.template(template, oklch_source)
	
	return {
		{ filename = "pino-legacy.conf", content = legacy_content }, { filename = "pino.conf", content = oklch_content }
	}
end

return M
