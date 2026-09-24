-- config
require("config.options")
require("config.filetypes")
require("config.keymaps")
require("config.autocmds")
require("config.packages")

-- plugins; order matters
require("plugins.nvchad-ui")
require("plugins.mason")
require("plugins.mason-lspconfig")
require("plugins.blink")
require("plugins.nvim-lspconfig")
require("plugins.oil")
require("plugins.telescope")
require("plugins.gitsigns")
require("plugins.nvim-surround")
require("plugins.nvim-autopairs")
require("plugins.quicker")

-- experimental
require('vim._core.ui2').enable({ enable = true })
