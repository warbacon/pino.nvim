local M = {}

M._load = function()
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end
	vim.g.colors_name = "pino"

	local colors = require("pino.colors").setup()
	local groups = require("pino.groups").setup(colors)

	for group, hl in pairs(groups) do
		vim.api.nvim_set_hl(0, group, hl)
	end

	vim.g.terminal_color_0 = colors.terminal.black
	vim.g.terminal_color_1 = colors.terminal.red
	vim.g.terminal_color_2 = colors.terminal.green
	vim.g.terminal_color_3 = colors.terminal.yellow
	vim.g.terminal_color_4 = colors.terminal.blue
	vim.g.terminal_color_5 = colors.terminal.magenta
	vim.g.terminal_color_6 = colors.terminal.cyan
	vim.g.terminal_color_7 = colors.terminal.white
	vim.g.terminal_color_8 = colors.terminal.bright_black
	vim.g.terminal_color_9 = colors.terminal.bright_red
	vim.g.terminal_color_10 = colors.terminal.bright_green
	vim.g.terminal_color_11 = colors.terminal.bright_yellow
	vim.g.terminal_color_12 = colors.terminal.bright_blue
	vim.g.terminal_color_13 = colors.terminal.bright_magenta
	vim.g.terminal_color_14 = colors.terminal.bright_cyan
	vim.g.terminal_color_15 = colors.terminal.bright_white
end

M.setup = require("pino.config").setup

return M
