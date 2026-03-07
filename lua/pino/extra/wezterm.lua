local M = {}

--- @param colors table
function M.generate(colors)
    local content = require("pino.util").template(
        [[
[colors]
foreground = "${text}"
background = "${base}"
cursor_fg = "${base}"
cursor_bg = "${text}"
cursor_border = "${text}"
selection_fg = "none"
selection_bg = "${ui.selection}"
scrollbar_thumb = "${muted}"
split = "${overlay}"

ansi = [
    "${terminal.black}",
    "${terminal.red}",
    "${terminal.green}",
    "${terminal.yellow}",
    "${terminal.blue}",
    "${terminal.magenta}",
    "${terminal.cyan}",
    "${terminal.white}",
]

brights = [
    "${terminal.bright_black}",
    "${terminal.bright_red}",
    "${terminal.bright_green}",
    "${terminal.bright_yellow}",
    "${terminal.bright_blue}",
    "${terminal.bright_magenta}",
    "${terminal.bright_cyan}",
    "${terminal.bright_white}",
]

[colors.tab_bar]
background = "${base}"
inactive_tab_edge = "${base}"

[colors.tab_bar.active_tab]
bg_color = "${pine}"
fg_color = "${base}"
intensity = "Bold"

[colors.tab_bar.inactive_tab]
bg_color = "${overlay}"
fg_color = "${muted}"

[colors.tab_bar.inactive_tab_hover]
bg_color = "${highlight}"
fg_color = "${subtle}"

[colors.tab_bar.new_tab]
bg_color = "${overlay}"
fg_color = "${muted}"

[colors.tab_bar.new_tab_hover]
bg_color = "${highlight}"
fg_color = "${text}"
]],
        colors
    )

    return {
        { filename = "pino.toml", content = content },
    }
end

return M
