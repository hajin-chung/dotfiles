function lsp_config()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
    callback = lsp_keymap_config
  })

  -- setup languages servers
  language_server_config()
end

function lsp_keymap_config(event)
  local map = function(keys, func, mode)
    mode = mode or "n"
    vim.keymap.set(mode, keys, func, { buffer = event.buf })
  end

  map("gd", require("telescope.builtin").lsp_definitions)
  map("gr", require("telescope.builtin").lsp_references)
  map("gI", require("telescope.builtin").lsp_implementations)
  map("<leader>D", require("telescope.builtin").lsp_type_definitions)
  map("<leader>ds", require("telescope.builtin").lsp_document_symbols)
  map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols)
  map("<leader>rn", vim.lsp.buf.rename)
  map("<leader>ca", vim.lsp.buf.code_action, { "n", "x" })
  map("gD", vim.lsp.buf.declaration)

  -- The following two autocommands are used to highlight references of the
  -- word under your cursor when your cursor rests there for a little while.
  --    See `:help CursorHold` for information about when this is executed
  --
  -- When you move your cursor, the highlights will be cleared (the second autocommand).
  local client = vim.lsp.get_client_by_id(event.data.client_id)
  if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
    local highlight_augroup =
      vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      buffer = event.buf,
      group = highlight_augroup,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      buffer = event.buf,
      group = highlight_augroup,
      callback = vim.lsp.buf.clear_references,
    })

    vim.api.nvim_create_autocmd("LspDetach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
      callback = function(event2)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
      end,
    })
  end

  -- The following code creates a keymap to toggle inlay hints in your
  -- code, if the language server you are using supports them
  --
  -- This may be unwanted, since they displace some of your code
  if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
    map("<leader>th", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
    end)
  end
end

function language_server_config()
  -- Enable the following language servers
  --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
  --
  -- cmd (table): Override the default command used to start the server
  -- filetypes (table): Override the default list of associated filetypes for the server
  -- capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
  -- settings (table): Override the default settings passed when initializing the server.
  --       For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
  local servers = {
    -- clangd = {},
    -- gopls = {},
    -- rust_analyzer = {},
    lua_ls = {
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace",
          },
          diagnostics = { disable = { 'missing-fields' } },
        },
      },
    },
  }

  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = vim.tbl_keys(servers),
    automatic_enable = true,
  })
end

return {
  {
    -- lua lsp for your neovim config, runtime and plugins
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- automatically install lsps and related tools
      { "williamboman/mason.nvim", config = true },
      { "williamboman/mason-lspconfig.nvim" },

      -- useful status updates for lsp.
      { "j-hui/fidget.nvim", opts = {} },
      "hrsh7th/cmp-nvim-lsp",
    },
    config = lsp_config
  }
}
