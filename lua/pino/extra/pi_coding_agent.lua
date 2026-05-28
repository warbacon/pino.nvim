local M = {}

---@param palette table
function M.generate(palette)
	local util = require("pino.util")
	local color = require("pino.color")
	local pi_colors = vim.tbl_extend("force", palette, {
		selection = palette.ui.selection,
		dim = palette.muted,
		tool_success_bg = color.blend(palette.leaf, 0.2, palette.base),
		tool_error_bg = color.blend(palette.love, 0.2, palette.base),
	})

	local content = util.template(
		[[{
  "$schema": "https://raw.githubusercontent.com/earendil-works/pi/main/packages/coding-agent/src/modes/interactive/theme/theme-schema.json",
  "name": "pino",
  "vars": {
    "bedrock": "${bedrock}",
    "base": "${base}",
    "surface": "${surface}",
    "overlay": "${overlay}",
    "highlight": "${highlight}",
    "selection": "${selection}",
    "text": "${text}",
    "subtle": "${subtle}",
    "muted": "${muted}",
    "foam": "${foam}",
    "gold": "${gold}",
    "iris": "${iris}",
    "leaf": "${leaf}",
    "love": "${love}",
    "pine": "${pine}",
    "rose": "${rose}",
    "zest": "${zest}"
  },
  "colors": {
    "accent": "pine",
    "border": "pine",
    "borderAccent": "foam",
    "borderMuted": "muted",
    "success": "leaf",
    "error": "love",
    "warning": "gold",
    "muted": "subtle",
    "dim": "muted",
    "text": "text",
    "thinkingText": "subtle",
    "selectedBg": "selection",
    "userMessageBg": "overlay",
    "userMessageText": "text",
    "customMessageBg": "surface",
    "customMessageText": "text",
    "customMessageLabel": "iris",
    "toolPendingBg": "surface",
    "toolSuccessBg": "${tool_success_bg}",
    "toolErrorBg": "${tool_error_bg}",
    "toolTitle": "rose",
    "toolOutput": "subtle",
    "mdHeading": "pine",
    "mdLink": "foam",
    "mdLinkUrl": "iris",
    "mdCode": "zest",
    "mdCodeBlock": "gold",
    "mdCodeBlockBorder": "muted",
    "mdQuote": "subtle",
    "mdQuoteBorder": "muted",
    "mdHr": "muted",
    "mdListBullet": "zest",
    "toolDiffAdded": "leaf",
    "toolDiffRemoved": "love",
    "toolDiffContext": "subtle",
    "syntaxComment": "subtle",
    "syntaxKeyword": "rose",
    "syntaxFunction": "pine",
    "syntaxVariable": "text",
    "syntaxString": "gold",
    "syntaxNumber": "zest",
    "syntaxType": "text",
    "syntaxOperator": "subtle",
    "syntaxPunctuation": "subtle",
    "thinkingOff": "muted",
    "thinkingMinimal": "subtle",
    "thinkingLow": "pine",
    "thinkingMedium": "foam",
    "thinkingHigh": "iris",
    "thinkingXhigh": "love",
    "bashMode": "gold"
  },
  "export": {
    "pageBg": "base",
    "cardBg": "surface",
    "infoBg": "highlight"
  }
}]],
		pi_colors
	)

	return { { filename = "pino.json", content = content } }
end

return M
