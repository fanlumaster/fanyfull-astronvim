-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    -- set to true or false etc.
    relativenumber = false, -- sets vim.opt.relativenumber
    number = true, -- sets vim.opt.number
    spell = false, -- sets vim.opt.spell
    signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    wrap = true, -- sets vim.opt.wrap
    -- guifont = "CaskaydiaCove Nerd Font:h14",
    -- guifont = {"CaskaydiaCove Nerd Font", "微软雅黑", ":h14"},
    -- guifont = {"CaskaydiaCove Nerd Font", "Maple Mono SC NF", ":h14"},
    guifont = {"CaskaydiaCove Nerd Font", "Source Han Sans CN", "微软雅黑", "Maple Mono SC NF", ":h13"},
    -- guifont = "Source Han Sans CN:h14",
    -- guifont = "Microsoft YaHei:h14",
    -- set terminal to powershell7
    shell = "pwsh",
    shellcmdflag = "-command",
    shellquote = "\"",
    shellxquote = "",
    scrolloff = 0,
    guicursor="n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait0-blinkoff0-blinkon0-Cursor/lCursor,sm:block-blinkwait0-blinkoff0-blinkon0",
    foldexpr = "nvim_treesitter#foldexpr()", -- set Treesitter based folding
    foldmethod = "expr",
    list = true,
    listchars = {
    space = "·",
    },
  },
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = false, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 0, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    resession_enabled = false, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
    neovide_input_ime = true,
    neovide_cursor_vfx_mode = "pixiedust", -- seems that only this mode will not lead to memory leak
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
