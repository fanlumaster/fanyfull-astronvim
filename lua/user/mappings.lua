-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- for hop.nvim
    ["<leader><leader>w"] = {
      function()
        vim.cmd('.g/^$/normal )')
        require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })
      end,
    },

    ["<leader><leader>e"] = {
      function()
        vim.cmd('.g/^$/normal )')
        require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, hint_position = require'hop.hint'.HintPosition.END })
      end,
    },

    ["<leader><leader>b"] = {
      function()
        -- ( move to next line begining that is not blank, then move to end, then use b to move to next first non-blank char before current cursor position
        vim.cmd('.g/^$/normal B()b')
        require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })
      end,
    },

    ["<leader><leader>a"] = {
      function()
        require'hop'.hint_anywhere()
      end,
    },

    ["<leader><leader>j"] = {
      function()
        vim.cmd('.g/^$/normal )')
        require'hop'.hint_lines({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })
      end,
    },

    ["<leader><leader>k"] = {
      function()
        vim.cmd('.g/^$/normal ()b')
        require'hop'.hint_lines({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })
      end,
    },

    ["<leader>py"] = { "<cmd>TermExec cmd=\"python %\"<cr>", desc = "Run python codes" },

  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    -- for hop.nvim
    ["<leader><leader>w"] = {
      function()
        vim.cmd('.g/^$/normal )')
        require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })
      end,
    },

    ["<leader><leader>e"] = {
      function()
        vim.cmd('.g/^$/normal )')
        require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, hint_position = require'hop.hint'.HintPosition.END })
      end,
    },

    ["<leader><leader>b"] = {
      function()
        -- ( move to next line begining that is not blank, then move to end, then use b to move to next first non-blank char before current cursor position
        vim.cmd('.g/^$/normal B()b')
        require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })
      end,
    },

    ["<leader><leader>a"] = {
      function()
        require'hop'.hint_anywhere()
      end,
    },

    ["<leader><leader>j"] = {
      function()
        vim.cmd('.g/^$/normal )')
        require'hop'.hint_lines({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })
      end,
    },

    ["<leader><leader>k"] = {
      function()
        vim.cmd('.g/^$/normal ()b')
        require'hop'.hint_lines({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })
      end,
    },
  }
}
