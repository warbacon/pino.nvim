local M = {}

---@param colors table<string,string>
---@return table<string,vim.api.keyset.highlight>
M.get = function(colors)
	local util = require("pino.util")

	return {
		RenderMarkdownH1Bg = { bg = util.blend(colors.pine, 0.1, colors.base) },
		RenderMarkdownH2Bg = { bg = util.blend(colors.gold, 0.1, colors.base) },
		RenderMarkdownH3Bg = { bg = util.blend(colors.leaf, 0.1, colors.base) },
		RenderMarkdownH4Bg = { bg = util.blend(colors.foam, 0.1, colors.base) },
		RenderMarkdownH5Bg = { bg = util.blend(colors.iris, 0.1, colors.base) },
		RenderMarkdownH6Bg = { bg = util.blend(colors.rose, 0.1, colors.base) },
		RenderMarkdownBullet = { fg = colors.zest },
	}
end

return M
