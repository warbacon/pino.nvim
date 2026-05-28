local M = {}

---@param palette table<string,string>
---@return table<string,vim.api.keyset.highlight>
M.get = function(palette)
	return {
		FzfLuaNormal = { fg = palette.text, bg = palette.base },
		FzfLuaBorder = { fg = palette.pine, bg = palette.base },
		FzfLuaTitle = { fg = palette.rose, bold = true },
		FzfLuaPreviewTitle = { fg = palette.pine },
		FzfLuaTitleFlags = { fg = palette.base, bg = palette.rose },
		FzfLuaFzfCursorLine = { link = "Visual" },
		FzfLuaFzfMatch = { fg = palette.love },
		FzfLuaFzfPointer = { fg = palette.rose },
		FzfLuaFzfPrompt = { fg = palette.rose },
		FzfLuaFzfScrollbar = { fg = palette.muted },
		FzfLuaScrollBorderEmpty = { link = "FzfLuaFzfScrollbar" },
		FzfLuaScrollBorderFull = { link = "FzfLuaFzfScrollbar" },
		FzfLuaHeaderBind = { link = "@punctuation.special" },
		FzfLuaHeaderText = { link = "Title" },
	}
end

return M
