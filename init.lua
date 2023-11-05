if vim.loader and vim.fn.has "nvim-0.9.1" == 1 then vim.loader.enable() end

for _, source in ipairs {
  "astronvim.bootstrap",
  "astronvim.options",
  "astronvim.lazy",
  "astronvim.autocmds",
  "astronvim.mappings",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

if astronvim.default_colorscheme then
  if not pcall(vim.cmd.colorscheme, astronvim.default_colorscheme) then
    require("astronvim.utils").notify(
      ("Error setting up colorscheme: `%s`"):format(astronvim.default_colorscheme),
      vim.log.levels.ERROR
    )
  end
end

require("astronvim.utils").conditional_func(astronvim.user_opts("polish", nil, false), true)

-- vim.cmd('highlight Cursor gui=NONE guifg=bg guibg=#afdfe4')
vim.cmd('highlight Cursor gui=NONE guifg=bg guibg=#ffb6c1')

-- register F11 to toggle fullscreen in normal mode
if vim.g.neovide == true then
    vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end

-- copy relative path
vim.cmd([[
command! -nargs=0 CpRelativePath lua require("user.fanyutils").copy_relative_path()
]])
-- copy relative path
vim.cmd([[
command! -nargs=0 CpFileName lua require("user.fanyutils").copy_current_filename()
]])

-- enable auto reload when file changed in other editors
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" }
})

