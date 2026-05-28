local M = {}

--- @param palette table
function M.generate(palette)
	local content = require("pino.util").template(
		[[
gui:
  spinner:
    rate: 80
    frames:
    - "⠋"
    - "⠙"
    - "⠹"
    - "⠸"
    - "⠼"
    - "⠴"
    - "⠦"
    - "⠧"
    - "⠇"
    - "⠏"
  theme:
    activeBorderColor:
      - "${pine}"
      - "bold"
    inactiveBorderColor:
      - "${subtle}"
    selectedLineBgColor:
      - "${ui.selection}"
    defaultFgColor:
      - "${text}"
]],
		palette
	)

	return {
		{ filename = "lazygit.yaml", content = content },
	}
end

return M
