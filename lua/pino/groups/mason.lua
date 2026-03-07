local M = {}

---@param colors table<string,string>
---@return table<string,vim.api.keyset.highlight>
M.get = function(colors)
    return {
        MasonHeader = { fg = colors.surface, bg = colors.zest, bold = true },
        MasonHeaderSecondary = { fg = colors.surface, bg = colors.pine, bold = true },
        MasonHighlight = { fg = colors.pine },
        MasonHighlightBlock = { bg = colors.pine, fg = colors.surface },
        MasonHighlightBlockBold = { bg = colors.pine, fg = colors.surface, bold = true },
        MasonHighlightBlockSecondary = { bg = colors.zest, fg = colors.surface },
        MasonHighlightBlockSecondaryBold = { bg = colors.zest, fg = colors.surface, bold = true },
        MasonHighlightSecondary = { fg = colors.zest, default = true },
        MasonMuted = { fg = colors.subtle },
        MasonMutedBlock = { bg = colors.highlight },
        MasonMutedBlockBold = { bg = colors.highlight, bold = true },
    }
end

return M
