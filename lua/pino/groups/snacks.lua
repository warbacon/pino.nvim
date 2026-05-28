local M = {}

---@param palette table<string,string>
---@return table<string,vim.api.keyset.highlight>
M.get = function(palette)
	return {
		SnacksPickerCursorline = { bg = palette.ui.selection },
		SnacksPickerMatch = { fg = palette.love },
		SnacksPickerPrompt = { fg = palette.rose },
		SnacksTitle = { fg = palette.rose, bg = palette.surface, bold = true },
		SnacksIndentScope = { fg = palette.pine },
		SnacksIndent = { fg = palette.highlight },
	}
end

return M
