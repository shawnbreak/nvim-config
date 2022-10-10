require('nightfox').setup({
  options = {
    transparent = false,
  },
})

-- setup must be called before loading
vim.cmd("colorscheme nightfox")

require('lualine').setup()


local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup{}
