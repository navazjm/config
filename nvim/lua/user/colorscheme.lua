-- vim.cmd([[
-- try
--   colorscheme dracula
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]])

-- require("onedark").setup {
--   style = "warmer",
--   transparent = true
-- }
-- require("onedark").load()

-- setup must be called before loading
vim.cmd("colorscheme nordfox")
