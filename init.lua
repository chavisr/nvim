-- config
require("options")
require("keymaps")
require("autocmds")
require("filetypes")
require("packages")

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
