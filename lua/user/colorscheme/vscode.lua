local colorscheme = "vscode"


local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

local c = require('vscode.colors')
require('vscode').setup({
    -- Enable transparent background
    transparent = false,

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    -- color_overrides = {
    --     vscLineNumber = '#FFFFFF',
    -- },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    -- group_overrides = {
    --     -- this supports the same val table as vim.api.nvim_set_hl
    --     -- use colors from this colorscheme by requiring vscode.colors!
    --     Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    -- }
})

require('lualine').setup {
    options = {
        theme =  'vscode'
    }
}


require("bufferline").setup({
    options = {
        buffer_close_icon = "",
        close_command = "Bdelete %d",
        close_icon = "",
        indicator_icon = " ",
        left_trunc_marker = "",
        modified_icon = "●",
        offsets = { { filetype = "NvimTree", text = "EXPLORER", text_align = "center" } },
        right_mouse_command = "Bdelete! %d",
        right_trunc_marker = "",
        show_close_icon = false,
        show_tab_indicators = true,
    },
    highlights = {
        fill = {
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "StatusLineNC" },
        },
        background = {
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "StatusLine" },
        },
        buffer_visible = {
            gui = "",
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "Normal" },
        },
        buffer_selected = {
            gui = "",
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "Normal" },
        },
        separator = {
            guifg = { attribute = "bg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "StatusLine" },
        },
        separator_selected = {
            guifg = { attribute = "fg", highlight = "Special" },
            guibg = { attribute = "bg", highlight = "Normal" },
        },
        separator_visible = {
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "StatusLineNC" },
        },
        close_button = {
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "StatusLine" },
        },
        close_button_selected = {
            guifg = { attribute = "fg", highlight = "normal" },
            guibg = { attribute = "bg", highlight = "normal" },
        },
        close_button_visible = {
            guifg = { attribute = "fg", highlight = "normal" },
            guibg = { attribute = "bg", highlight = "normal" },
        },
    },
})
