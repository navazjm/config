-- vim.cmd([[
-- try
--   colorscheme dracula
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]])

require("onedark").setup {
    style = "warmer"
}
require("onedark").load()