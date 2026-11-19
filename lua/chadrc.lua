-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",
  transparency = false,

  hl_override = {
    -- statusline transparency only (same effect as base46.transparency = true)
    StatusLine = { bg = "none" },
    StatusLineNC = { bg = "none" },
    St_gitIcons = { bg = "none" },
    St_Lsp = { bg = "none" },
    St_LspMsg = { bg = "none" },
    St_lspError = { bg = "none" },
    St_lspWarning = { bg = "none" },
    St_LspHints = { bg = "none" },
    St_LspInfo = { bg = "none" },

    -- tab buffer
    TbFill = { bg = "#1e222a" },
    -- TbBufOff = { fg = "#abb2bf", bg = "#2d3139" },
    -- TbBufOffClose = { bg = "#2d3139" },
    -- TbBufOffModified = { bg = "#2d3139" },
  },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
  -- cmp = {
  --   lspkind_text = true,
  --   style = "default",    -- default/flat_light/flat_dark/atom/atom_colored
  --   format_colors = {
  --     lsp = true,
  --   },
  -- },

  telescope = { style = "borderless" }, -- borderless / bordered

  statusline = {
    enabled = true,
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "block",
    order = nil,
    -- order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    modules = nil,
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    enabled = true,
    lazyload = true,
    -- treeOffsetFt = "NvimTree",
    -- order = { "treeOffset", "buffers", "tabs", "btns" },
    order = { "buffers", "tabs" },
    modules = nil,
    bufwidth = 21,
  },

}

return M
