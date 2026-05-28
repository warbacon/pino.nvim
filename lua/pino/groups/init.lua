local M = {}

---@param palette? table<string, any>
M.setup = function(palette)
	local color = require("pino.color")
	local opts = require("pino.config").options
	local highlights

	if not palette then
		palette = require("pino.palette").setup()
	end

	local oklch = palette.oklch or palette

	---@type table<string, vim.api.keyset.highlight>
	highlights = {
		-- UI
		ColorColumn = { bg = palette.surface },
		CurSearch = { fg = palette.base, bg = palette.zest },
		CursorColumn = { link = "CursorLine" },
		CursorLine = { bg = palette.overlay },
		CursorLineNr = { fg = palette.text, bold = true },
		FloatBorder = { fg = palette.pine, bg = palette.surface },
		FloatTitle = { fg = palette.pine, bg = palette.surface, bold = opts.style.bold },
		FoldColumm = { link = "LineNr" },
		Folded = { bg = palette.highlight },
		LineNr = { fg = palette.muted },
		MatchParen = { bg = palette.highlight },
		NonText = { fg = palette.subtle },
		Normal = { fg = palette.text, bg = palette.base },
		NormalFloat = { bg = palette.surface },
		Pmenu = { bg = palette.surface },
		PmenuBorder = { link = "FloatBorder" },
		PmenuExtra = { fg = palette.subtle, italic = opts.style.italic },
		PmenuKind = { fg = palette.subtle },
		PmenuSbar = { bg = palette.overlay },
		PmenuSel = { bg = palette.highlight },
		PmenuThumb = { bg = palette.muted },
		Question = { fg = palette.foam },
		QuickFixLine = { fg = palette.zest },
		Search = { fg = "white", bg = color.blend(oklch.zest, 0.4, oklch.base) },
		SignColumn = { link = "LineNr" },
		StatusLine = { fg = palette.subtle, bg = palette.surface },
		StatusLineNC = { fg = palette.muted, bg = palette.surface },
		TabLine = { fg = palette.subtle, bg = palette.overlay },
		TabLineFill = { bg = palette.surface },
		TabLineSel = { fg = palette.base, bg = palette.pine, bold = true },
		Visual = { bg = palette.ui.selection },
		WinBar = { fg = palette.subtle, bg = palette.surface },
		WinBarNC = { fg = palette.muted, bg = palette.surface },
		WinSeparator = { fg = palette.highlight },

		-- Syntax
		Comment = { fg = palette.subtle, italic = opts.style.italic },
		Conceal = { fg = palette.subtle },
		Constant = { fg = palette.zest },
		Delimiter = { fg = palette.subtle },
		Directory = { fg = palette.pine },
		Function = { fg = palette.pine },
		Identifier = { fg = palette.foam },
		Operator = { fg = palette.subtle },
		PreProc = { fg = palette.rose },
		Quote = { fg = palette.subtle },
		Special = { fg = palette.iris },
		Statement = { fg = palette.rose, italic = opts.style.italic },
		String = { fg = palette.gold },
		Title = { fg = palette.pine, bold = opts.style.bold },
		Type = { fg = palette.text, bold = opts.style.bold },

		-- Messages
		Error = { fg = palette.love },
		ErrorMsg = { fg = palette.love },
		ModeMsg = { fg = palette.zest, bold = opts.style.bold },
		MoreMsg = { fg = palette.pine },
		OkMsg = { fg = palette.leaf },
		WarningMsg = { fg = palette.gold },

		-- Diagnostics
		DiagnosticError = { fg = palette.love },
		DiagnosticHint = { fg = palette.pine },
		DiagnosticInfo = { fg = palette.foam },
		DiagnosticWarn = { fg = palette.gold },
		DiagnosticFloatingError = { fg = palette.love, bg = palette.surface },
		DiagnosticFloatingHint = { fg = palette.pine, bg = palette.surface },
		DiagnosticFloatingInfo = { fg = palette.foam, bg = palette.surface },
		DiagnosticFloatingWarn = { fg = palette.gold, bg = palette.surface },
		DiagnosticUnderlineError = {
			sp = palette.love,
			undercurl = opts.style.undercurl,
			underline = not opts.style.undercurl,
		},
		DiagnosticUnderlineHint = {
			sp = palette.pine,
			undercurl = opts.style.undercurl,
			underline = not opts.style.undercurl,
		},
		DiagnosticUnderlineInfo = {
			sp = palette.foam,
			undercurl = opts.style.undercurl,
			underline = not opts.style.undercurl,
		},
		DiagnosticUnderlineWarn = {
			sp = palette.gold,
			undercurl = opts.style.undercurl,
			underline = not opts.style.undercurl,
		},
		DiagnosticVirtualtextError = { fg = palette.love, bg = color.blend(oklch.love, 0.1, oklch.base) },
		DiagnosticVirtualtextHint = { fg = palette.pine, bg = color.blend(oklch.pine, 0.1, oklch.base) },
		DiagnosticVirtualtextInfo = { fg = palette.foam, bg = color.blend(oklch.foam, 0.1, oklch.base) },
		DiagnosticVirtualtextWarn = { fg = palette.gold, bg = color.blend(oklch.gold, 0.1, oklch.base) },

		-- Diff
		Added = { fg = palette.leaf },
		Changed = { fg = palette.pine },
		Removed = { fg = palette.love },
		diffChanged = { link = "Changed" },
		diffAdded = { link = "Added" },
		diffRemoved = { link = "Removed" },
		DiffAdd = { bg = color.blend(oklch.leaf, 0.25, oklch.base) },
		DiffChange = { bg = color.blend(oklch.pine, 0.1, oklch.base) },
		DiffDelete = { bg = color.blend(oklch.love, 0.25, oklch.base) },
		DiffText = { bg = color.blend(oklch.pine, 0.25, oklch.base) },

		-- Treesitter
		["@function.builtin"] = { fg = palette.pine, italic = opts.style.italic },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
		["@lsp.type.variable"] = { fg = "none" },
		["@markup.heading.1.markdown"] = { fg = palette.pine, bold = opts.style.bold },
		["@markup.heading.2.markdown"] = { fg = palette.gold, bold = opts.style.bold },
		["@markup.heading.3.markdown"] = { fg = palette.leaf, bold = opts.style.bold },
		["@markup.heading.4.markdown"] = { fg = palette.foam, bold = opts.style.bold },
		["@markup.heading.5.markdown"] = { fg = palette.iris, bold = opts.style.bold },
		["@markup.heading.6.markdown"] = { fg = palette.rose, bold = opts.style.bold },
		["@markup.link"] = { underline = false },
		["@markup.link.label"] = { fg = palette.foam },
		["@markup.link.url"] = { fg = palette.iris, underline = true },
		["@markup.list.markdown"] = { fg = palette.zest },
		["@markup.quote.markdown"] = { fg = palette.subtle },
		["@markup.raw"] = { bg = palette.overlay },
		["@markup.raw.block"] = { bg = "none" },
		["@module.builtin"] = { fg = palette.love },
		["@punctuation"] = { link = "Delimiter" },
		["@punctuation.special"] = { link = "Delimiter" },
		["@tag"] = { fg = palette.love, bold = opts.style.bold },
		["@tag.attribute"] = { fg = palette.foam },
		["@tag.delimiter"] = { link = "Delimiter" },
		["@variable"] = { fg = palette.text },
		["@variable.builtin"] = { fg = palette.love, bold = opts.style.bold },
		["@variable.member"] = { fg = palette.foam },

		-- LSP
		["@lsp.typemod.variable.readonly"] = { link = "Constant" },
	}

	local enabled_plugins = opts.plugins or {}
	for plugin_name, enabled in pairs(enabled_plugins) do
		if enabled then
			local ok, plugin_highlights = pcall(function()
				return require("pino.groups." .. plugin_name).get(palette, opts)
			end)
			if ok then
				highlights = vim.tbl_extend("force", highlights, plugin_highlights)
			end
		end
	end

	opts.on_highlights(highlights, palette)

	return highlights
end

return M
