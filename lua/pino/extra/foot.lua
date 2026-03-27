local M = {}

--- @param colors table
function M.generate(colors)
	-- Foot doesn't support hex colors with #, so we need to remove it
	local foot_colors = {}
	for k, v in pairs(colors) do
		if type(v) == "string" then
			foot_colors[k] = v:sub(2)
		elseif type(v) == "table" then
			foot_colors[k] = {}
			for sk, sv in pairs(v) do
				if type(sv) == "string" then
					foot_colors[k][sk] = sv:sub(2)
				end
			end
		end
	end

	local content = require("pino.util").template(
		[[
[colors-dark]
foreground=${text}
background=${base}
selection-background=${ui.selection}

# Black
regular0=${terminal.black}
bright0=${terminal.bright_black}

# Red
regular1=${terminal.red}
bright1=${terminal.bright_red}

# Green
regular2=${terminal.green}
bright2=${terminal.bright_green}

# Yellow
regular3=${terminal.yellow}
bright3=${terminal.bright_yellow}

# Blue
regular4=${terminal.blue}
bright4=${terminal.bright_blue}

# Magenta
regular5=${terminal.magenta}
bright5=${terminal.bright_magenta}

# Cyan
regular6=${terminal.cyan}
bright6=${terminal.bright_cyan}

# White
regular7=${terminal.white}
bright7=${terminal.bright_white}
]],
		foot_colors
	)

	return {
		{ filename = "pino.ini", content = content },
	}
end

return M
