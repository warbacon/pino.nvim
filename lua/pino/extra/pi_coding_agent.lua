local M = {}

---@param colors table
function M.generate(colors)
  local util = require("pino.util")
  local pi_colors = vim.tbl_extend("force", colors, {
    selection = colors.ui.selection,
    dim = colors.muted,
    tool_success_bg = util.blend(colors.leaf, 0.2, colors.base),
    tool_error_bg = util.blend(colors.love, 0.2, colors.base)
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
}]], pi_colors
  )

  return { { filename = "pino.json", content = content } }
end

return M
