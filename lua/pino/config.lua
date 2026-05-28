local M = {}

---@class pino.Config
---@field style? pino.Config.Style
---@field plugins? pino.Config.Plugins
---@field on_palette? fun(palette: table<string, any>)
---@field on_highlights? fun(highlights: table<string,vim.api.keyset.highlight>, palette: table<string, any>)

---@class pino.Config.Style
---@field italic? boolean
---@field bold? boolean
---@field undercurl? boolean

---@class pino.Config.Plugins
---@field blink_cmp? boolean
---@field fzf_lua? boolean
---@field indent_blankline? boolean
---@field lualine? boolean
---@field mason? boolean
---@field mini? boolean
---@field render_markdown? boolean
---@field snacks? boolean

M.defaults = {
	style = {
		italic = true,
		bold = true,
		undercurl = true,
	},
	plugins = {
		blink_cmp = true,
		fzf_lua = false,
		indent_blankline = false,
		lualine = true,
		mason = true,
		mini = false,
		snacks = false,
		render_markdown = true,
	},
	---@diagnostic disable-next-line: unused-local
	on_palette = function(palette) end,
	---@diagnostic disable-next-line: unused-local
	on_highlights = function(highlights, palette) end,
}

---@type pino.Config
M.options = nil

---@param opts? pino.Config
M.setup = function(opts)
	M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
end

setmetatable(M, {
	__index = function(_, k)
		if k == "options" then
			return M.defaults
		end
	end,
})

return M
