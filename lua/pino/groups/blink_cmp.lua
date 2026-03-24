local M = {}

---@param colors table<string,string>
---@return table<string,vim.api.keyset.highlight>
M.get = function(colors)
	return {
		BlinkCmpKindClass = { link = "Type" },
		BlinkCmpKindColor = { link = "Special" },
		BlinkCmpKindConstant = { link = "Constant" },
		BlinkCmpKindConstructor = { link = "Function" },
		BlinkCmpKindEnumMember = { link = "Constant" },
		BlinkCmpKindEvent = { link = "Special" },
		BlinkCmpKindFile = { fg = colors.text },
		BlinkCmpKindFolder = { link = "Directory" },
		BlinkCmpKindInterface = { link = "Type" },
		BlinkCmpKindFunction = { link = "Function" },
		BlinkCmpKindKeyword = { fg = colors.rose },
		BlinkCmpKindMethod = { link = "Function" },
		BlinkCmpKindModule = { link = "Directory" },
		BlinkCmpKindEnum = { link = "Identifier" },
		BlinkCmpKindField = { link = "Identifier" },
		BlinkCmpKindOperator = { link = "Operator" },
		BlinkCmpKindProperty = { link = "Identifier" },
		BlinkCmpKindReference = { link = "Identifier" },
		BlinkCmpKindStruct = { link = "Type" },
		BlinkCmpKindTypeParameter = { link = "Identifier" },
		BlinkCmpKindUnit = { link = "Constant" },
		BlinkCmpKindValue = { link = "Constant" },
		BlinkCmpKindVariable = { link = "Identifier" },
	}
end

return M
