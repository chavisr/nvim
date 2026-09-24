-- vim.pack build hook
local function run_build(spec, path)
  local build = spec.data and spec.data.build
  if not build then return end

  vim.system({ "sh", "-c", build }, {
    cwd = path,
    text = true,
  })
end

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    if ev.data.kind == "install" or ev.data.kind == "update" then
      run_build(ev.data.spec, ev.data.path)
    end
  end,
})

-- vim.pack lazy load
for _, plug in ipairs(vim.pack.get()) do
  local spec = plug.spec

  if spec.data and spec.data.event then
    vim.api.nvim_create_autocmd(spec.data.event, {
      once = true,
      callback = function()
        vim.cmd("packadd " .. spec.name)
      end,
    })
  end
end

-- add package
vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/echasnovski/mini.icons" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvchad/ui" },
  { src = "https://github.com/nvchad/base46" },
  { src = "https://github.com/nvchad/volt" },
  {
    src = "https://github.com/saghen/blink.cmp",
    version = "v1",
    data = {
      event = "InsertEnter"
    }
  },
  { src = "https://github.com/rafamadriz/friendly-snippets", },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/kylechui/nvim-surround" },
  { src = "https://github.com/folke/lazy.nvim" },
  {
    src = "https://github.com/windwp/nvim-autopairs",
    data = {
      event = "InsertEnter"
    }
  },
  {
    src = "https://github.com/iamcco/markdown-preview.nvim",
    data = {
      build = "cd app && ./install.sh",
    },
  },
  { src = "https://github.com/stevearc/quicker.nvim" },
})
