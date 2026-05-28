local M = {}

---@param palette table<string,string>
---@return table<string,vim.api.keyset.highlight>
M.get = function(palette)
	return {
		IblWhiteSpace = { fg = palette.highlight },
		IblScope = { fg = palette.pine },
	}
end

return M
