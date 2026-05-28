local M = {}

---@param palette table<string,string>
---@return table<string,vim.api.keyset.highlight>
M.get = function(palette)
	return {
		MasonHeader = { fg = palette.surface, bg = palette.zest, bold = true },
		MasonHeaderSecondary = { fg = palette.surface, bg = palette.pine, bold = true },
		MasonHighlight = { fg = palette.pine },
		MasonHighlightBlock = { bg = palette.pine, fg = palette.surface },
		MasonHighlightBlockBold = { bg = palette.pine, fg = palette.surface, bold = true },
		MasonHighlightBlockSecondary = { bg = palette.zest, fg = palette.surface },
		MasonHighlightBlockSecondaryBold = { bg = palette.zest, fg = palette.surface, bold = true },
		MasonHighlightSecondary = { fg = palette.zest, default = true },
		MasonMuted = { fg = palette.subtle },
		MasonMutedBlock = { bg = palette.highlight },
		MasonMutedBlockBold = { bg = palette.highlight, bold = true },
	}
end

return M
