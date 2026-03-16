return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local api = require("nvim-tree.api")

    local function on_attach(bufnr)
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- Default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- Override double-click and add single-click
      vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "<LeftRelease>", api.node.open.edit, opts("Open"))
    end

    require("nvim-tree").setup({
      on_attach = on_attach,
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
    })
  end,
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file tree" },
  },
}
