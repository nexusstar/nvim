local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'eslint',
  'gopls',
  'rust_analyzer',
  'tailwindcss',
  'tsserver',
})
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping(cmp.mapping.complete({
        reason = cmp.ContextReason.Auto,
      }), {"i", "c"}),
})
lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
  sign_icons = {
    error = " ",
    warn = " ",
    hint = "",
    info = "",
  }
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

local function on_list()
-- open Telescope list
  vim.cmd('Telescope lsp_definitions')
end

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function () vim.lsp.buf.definition { reuse_win = true, on_list = on_list } end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<leader>lj", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<leader>lk", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "ga", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>ls", function() vim.lsp.buf.workspace_symbol('') end, opts)
  vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.references({ includeDeclaration = false }) end, opts)
end)

lsp.setup()

