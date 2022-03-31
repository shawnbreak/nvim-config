require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
if not vim.fn.has("macunix") then
    require "user.treesitter"
end
require "user.nvimtree"
require "user.bufferline"
require "user.gitsigns"

