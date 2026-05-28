local M = {}

---@param palette table<string,string>
---@return table<string,vim.api.keyset.highlight>
M.get = function(palette)
	return {
		MiniPickMatchCurrent = { link = "PmenuSel" },
		MiniPickMatchMarked = { bg = palette.ui.selection },
		MiniPickMatchRanges = { fg = palette.love },
		MiniPickPrompt = { fg = "none", bg = palette.surface },
		MiniPickPromptCaret = { fg = palette.rose, bg = palette.surface },
		MiniPickPromptPrefix = { fg = palette.rose, bg = palette.surface },
		MiniStatuslineModeNormal = { fg = palette.surface, bg = palette.pine },
		MiniStatuslineModeInsert = { fg = palette.surface, bg = palette.leaf },
		MiniStatuslineModeVisual = { fg = palette.surface, bg = palette.iris },
		MiniStatuslineModeReplace = { fg = palette.surface, bg = palette.love },
		MiniStatuslineModeCommand = { fg = palette.surface, bg = palette.gold },
		MiniStatuslineModeOther = { fg = palette.surface, bg = palette.leaf },
		MiniStatuslineDevinfo = { fg = palette.subtle, bg = palette.highlight },
		MiniStatuslineFileinfo = { fg = palette.subtle, bg = palette.highlight },
		MiniStatuslineFilename = { fg = palette.subtle },
		MiniIndentscopeSymbol = { fg = palette.pine },
	}
end

return M
