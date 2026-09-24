vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "vv", "^vg_")
vim.keymap.set("n", "<leader>e", ":Oil<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":bdelete<CR>")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fG", ":lua require('telescope.builtin').live_grep{additional_args={'-s'}}<CR>")
vim.keymap.set("n", "<leader>fw", ":Telescope grep_string<CR>")
vim.keymap.set('n', '<Tab>', ':bnext<CR>')
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>')
vim.keymap.set("n", "<leader><Tab>", ":e#<CR>")
vim.keymap.set("n", "<leader>u", ":e!<CR>")
vim.keymap.set("n", "y", '"+y')
vim.keymap.set("v", "y", '"+y')
vim.keymap.set("n", "Y", '"+y$')
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-/>", "gcc", { remap = true })
vim.keymap.set("v", "<C-/>", "gc", { remap = true })
vim.keymap.set("n", "<C-_>", "gcc", { remap = true })
vim.keymap.set("v", "<C-_>", "gc", { remap = true })
vim.keymap.set("n", "<M-j>", ":cnext<CR>")
vim.keymap.set("n", "<M-k>", ":cprev<CR>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>vi", ":edit $MYVIMRC<CR>")
vim.keymap.set("n", "<leader>td", ":edit $HOME/.todo.md<CR>")
vim.keymap.set("n", "<leader>r", function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle line wrap" })

-- copy file path and line range
local function copy_ref(opts)
  opts = opts or {}

  local path = vim.fn.expand("%:p")
  if path == "" then
    vim.notify("No file to copy a reference for", vim.log.levels.WARN)
    return
  end

  local ref = path

  if opts.visual then
    local start_line = vim.fn.line("v")
    local end_line = vim.fn.line(".")

    if start_line > end_line then
      start_line, end_line = end_line, start_line
    end

    ref = (start_line == end_line)
        and (path .. ":" .. start_line)
        or (path .. ":" .. start_line .. "-" .. end_line)

    -- briefly highlight the selected lines
    local bufnr = vim.api.nvim_get_current_buf()
    local ns = vim.api.nvim_create_namespace("copy_ref_highlight")

    vim.hl.range(
      bufnr,
      ns,
      "IncSearch",
      { start_line - 1, 0 },
      { end_line - 1, -1 },
      { inclusive = true }
    )

    vim.defer_fn(function()
      if vim.api.nvim_buf_is_valid(bufnr) then
        vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
      end
    end, 150)

    vim.cmd("normal! \27")
    vim.api.nvim_win_set_cursor(0, { start_line, 0 })
  end

  vim.fn.setreg("+", ref)
  vim.notify("Copied: " .. ref)
end

vim.keymap.set("x", "<leader>y", function()
  copy_ref({ visual = true })
end, { desc = "Copy file path with line range" })

vim.keymap.set("n", "<leader>y", function()
  copy_ref({ visual = false })
end, { desc = "Copy absolute file path" })
