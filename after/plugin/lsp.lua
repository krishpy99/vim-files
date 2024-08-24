local lsp_zero = require('lsp-zero')

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
  local opts = {buffer = bufnr}
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
end


lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

require'lspconfig'.pylsp.setup{}

require'lspconfig'.lua_ls.setup{
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
		},
	},
}

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({}),
})
