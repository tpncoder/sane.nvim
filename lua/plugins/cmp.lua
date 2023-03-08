local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then return end
require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
    snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,},
    window = {
		completion = {
      		scrollbar = false,
    	},
    },

    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),

confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
	},
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "path" },
      { name = "luasnip" },
    })
  })

  cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
      { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
    })
  })

  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" }
    }
  })


 local lspkind = require('lspkind')
cmp.setup {
  formatting = {
		fields = { "kind", "abbr", "menu" },
      format = function(entry, item)
        local icons = require("core.icons").kinds
    	    item.kind = icons[item.kind]
      	  item.menu = ({
            nvim_lsp = "Lsp",
            nvim_lua = "Lua",
            luasnip = "Snippet",
            buffer = "Buffer",
            path = "Path",
          })[entry.source.name]
            return item
          end,
  }
}

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig")["svelte"].setup { capabilities = capabilities }
--require("lspconfig")["sumneko_lua"].setup { capabilities = capabilities }
require("lspconfig")["eslint"].setup { capabilities = capabilities }
require("lspconfig")["tsserver"].setup { capabilities = capabilities }
require("lspconfig")["vuels"].setup { capabilities = capabilities }
require("lspconfig")["volar"].setup { capabilities = capabilities }
require("lspconfig")["tailwindcss"].setup { capabilities = capabilities }

require("luasnip.loaders.from_lua").lazy_load()
