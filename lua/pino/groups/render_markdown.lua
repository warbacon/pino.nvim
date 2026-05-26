local M = {}

---@param colors table<string,string>
---@return table<string,vim.api.keyset.highlight>
M.get = function(colors)
	local util = require("pino.util")
	local oklch = colors.oklch or colors

	return {
		RenderMarkdownH1Bg = { bg = util.blend(oklch.pine, 0.1, oklch.base) },
		RenderMarkdownH2Bg = { bg = util.blend(oklch.gold, 0.1, oklch.base) },
		RenderMarkdownH3Bg = { bg = util.blend(oklch.leaf, 0.1, oklch.base) },
		RenderMarkdownH4Bg = { bg = util.blend(oklch.foam, 0.1, oklch.base) },
		RenderMarkdownH5Bg = { bg = util.blend(oklch.iris, 0.1, oklch.base) },
		RenderMarkdownH6Bg = { bg = util.blend(oklch.rose, 0.1, oklch.base) },
		RenderMarkdownBullet = { fg = colors.zest },
	}
end

return M
