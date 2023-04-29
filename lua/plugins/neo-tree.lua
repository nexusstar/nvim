return {
  'nvim-neo-tree/neo-tree.nvim',
  cmd = { 'Neotree', 'NeoTreeFind' },
  branch = 'v2.x',
  keys = {
    { '<leader>p', '<cmd>Neotree toggle<cr>', desc = 'NeoTree' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    filesystem = {
      follow_current_file = true,
      hijack_netrw_behavior = 'open_current',
    },
    default_component_configs = {
      symbols = {
        -- Change type
        added     = "✚",
        deleted   = "✖",
        modified  = "",
        renamed   = "",
        -- Status type
        untracked = "U",
        ignored   = "◌",
        unstaged  = "",
        staged    = "",
        conflict  = "",
      }
    },
    window = {
      position = "float",
      reveal = true,
      popup = { -- settings that apply to float position only
        size = { height = "20", width = "45" },
        position = "50%", -- 50% means center it
      },
    },
  },
}
