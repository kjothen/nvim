return {
  -- Configure clojure-lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clojure_lsp = {
          mason = false, -- Use Nix-provided clojure-lsp instead of Mason
          root_markers = { ".git" },
        },
      },
    },
  },
  -- Conjure REPL
  {
    "Olical/conjure",
    ft = { "clojure", "fennel", "python" }, -- etc
    lazy = true,
    init = function()
      -- Set LSP log level to INFO for debugging
      vim.lsp.set_log_level("INFO")

      -- Set configuration options here
      -- Uncomment this to get verbose logging to help diagnose internal Conjure issues
      -- This is VERY helpful when reporting an issue with the project
      -- vim.g["conjure#debug"] = true
      vim.g["conjure#extract#tree_sitter#enabled"] = true

      -- Disable the HUD so output goes to a persistent split instead
      vim.g["conjure#log#hud#enabled"] = false
    end,
  },
}
