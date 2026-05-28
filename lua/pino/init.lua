local M = {}

M._load = function()
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end
	vim.g.colors_name = "pino"

	local palette = require("pino.palette").setup()
	local groups = require("pino.groups").setup(palette)

	for group, hl in pairs(groups) do
		vim.api.nvim_set_hl(0, group, hl)
	end

	vim.g.terminal_color_0 = palette.terminal.black
	vim.g.terminal_color_1 = palette.terminal.red
	vim.g.terminal_color_2 = palette.terminal.green
	vim.g.terminal_color_3 = palette.terminal.yellow
	vim.g.terminal_color_4 = palette.terminal.blue
	vim.g.terminal_color_5 = palette.terminal.magenta
	vim.g.terminal_color_6 = palette.terminal.cyan
	vim.g.terminal_color_7 = palette.terminal.white
	vim.g.terminal_color_8 = palette.terminal.bright_black
	vim.g.terminal_color_9 = palette.terminal.bright_red
	vim.g.terminal_color_10 = palette.terminal.bright_green
	vim.g.terminal_color_11 = palette.terminal.bright_yellow
	vim.g.terminal_color_12 = palette.terminal.bright_blue
	vim.g.terminal_color_13 = palette.terminal.bright_magenta
	vim.g.terminal_color_14 = palette.terminal.bright_cyan
	vim.g.terminal_color_15 = palette.terminal.bright_white
end

M.setup = require("pino.config").setup

return M
