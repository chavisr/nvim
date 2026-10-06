-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", {
--   fg = "#e06c75", -- text color
--   undercurl = true,
-- })
-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", {
--   fg = "#e5c07b",
--   undercurl = true,
-- })
-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", {
--   fg = "#56b6c2",
--   undercurl = true,
-- })
-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", {
--   fg = "#c678dd",
--   undercurl = true,
-- })

vim.diagnostic.config({
  -- virtual_lines = true,
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    -- style = 'minimal',
    border = "rounded",
    -- source = true,
  },
})

vim.lsp.config("bashls", {
  settings = {
    bashIde = {
      shfmt = {
        caseIndent = true,
      },
    },
  },
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        -- Tell the language server that 'vim' is a valid global variable
        globals = { 'vim' },
      },
    },
  },
})
