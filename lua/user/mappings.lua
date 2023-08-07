-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next Buffer",
    },
    ["<leader>bo"] = {
      function() require("astronvim.utils.buffer").close_all(true) end,
      desc = "Close all buffers except current",
    },
    ["<leader>gp"] = {
      function() require("actions-preview").code_actions() end,
      desc = "Code Actions",
    },
    ["<leader>tg"] = {
      function()
        local utils = require "astronvim.utils"
        local worktree = require("astronvim.utils.git").file_worktree()
        local flags = worktree and (" --work-tree=%s --git-dir=%s"):format(worktree.toplevel, worktree.gitdir) or ""
        utils.toggle_term_cmd("gitui " .. flags)
      end,
      desc = "ToggleTerm gitui",
    },
    ["<leader>gg"] = {
      function()
        local utils = require "astronvim.utils"
        local worktree = require("astronvim.utils.git").file_worktree()
        local flags = worktree and (" --work-tree=%s --git-dir=%s"):format(worktree.toplevel, worktree.gitdir) or ""
        utils.toggle_term_cmd("gitui " .. flags)
      end,
      desc = "ToggleTerm gitui",
    },

    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>["] = { ":call append(line('.')-1, '')<cr>", desc = "adding a blank line upwards" },
    ["<leader>]"] = { ":call append(line('.'), '')<cr>", desc = "adding a blank line downpwards" },
  },
  i = {
    ["jj"] = { "<c-o>:call search('}\\|)\\|]\\|>\\|\"', 'cW')<cr><Right>", desc = "out of right bracket" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
