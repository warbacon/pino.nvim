local M = {}

---@param palette table<string, any>
---@return table<string,vim.api.keyset.highlight>
M.get = function(palette)
	local color = require("pino.color")

	local oklch = palette.oklch or palette

	return {
		RenderMarkdownH1Bg = { bg = color.blend(oklch.pine, 0.1, oklch.base) },
		RenderMarkdownH2Bg = { bg = color.blend(oklch.gold, 0.1, oklch.base) },
		RenderMarkdownH3Bg = { bg = color.blend(oklch.leaf, 0.1, oklch.base) },
		RenderMarkdownH4Bg = { bg = color.blend(oklch.foam, 0.1, oklch.base) },
		RenderMarkdownH5Bg = { bg = color.blend(oklch.iris, 0.1, oklch.base) },
		RenderMarkdownH6Bg = { bg = color.blend(oklch.rose, 0.1, oklch.base) },
		RenderMarkdownBullet = { fg = palette.zest },
	}
end

return M
