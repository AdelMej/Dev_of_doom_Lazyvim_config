return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        svelte = function(_, opts)
          opts.on_attach = function(client, bufnr)
            if client.server_capabilities.semanticTokensProvider then
              vim.lsp.semantic_tokens.start(bufnr, client.id)
            end
          end
        end,
      },
    },
  },
}
