return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- cmp_nvim_lsp
        "neovim/nvim-lspconfig", -- lspconfig
        "onsails/lspkind-nvim", -- lspkind (VS pictograms)
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
            dependencies = {"rafamadriz/friendly-snippets"}, -- Snippets
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
                -- https://github.com/rafamadriz/friendly-snippets/blob/main/snippets/go.json
            end
        }, {"saadparwaiz1/cmp_luasnip", enabled = true}
    },
    config = function()
        local luasnip = require("luasnip")
        local types = require("luasnip.util.types")

        -- Display virtual text to indicate snippet has more nodes
        luasnip.config.setup({
            ext_opts = {
                [types.choiceNode] = {
                    active = {virt_text = {{"⇥", "GruvboxRed"}}}
                },
                [types.insertNode] = {
                    active = {virt_text = {{"⇥", "GruvboxBlue"}}}
                }
            }
        })

        local cmp = require("cmp")
        local lspkind = require("lspkind")

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({select = true}),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, {"i", "s"})
            }),
            sources = cmp.config.sources({
                {name = "nvim_lsp"}, {name = "luasnip"}, {name = "buffer"}
            }),
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = 70,
                    show_labelDetails = true
                })
            }
        })

        -- Server configs ship with nvim-lspconfig under `lsp/`; configure and
        -- enable them with the native API (Neovim 0.11+). See :help lsp-config

        -- advertise nvim-cmp completion capabilities to every server
        vim.lsp.config("*", {
            capabilities = require("cmp_nvim_lsp").default_capabilities()
        })

        -- Python: pyright owns types/hover, ruff owns lint + formatting.
        -- Disable ruff's hover so pyright is the single hover provider.
        vim.lsp.config("ruff", {
            on_attach = function(client)
                client.server_capabilities.hoverProvider = false
            end
        })

        -- Format Python on save with ruff (pyright does not format)
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.py",
            group = vim.api.nvim_create_augroup("py_format_on_save", {clear = true}),
            callback = function()
                vim.lsp.buf.format({
                    filter = function(client)
                        return client.name == "ruff"
                    end
                })
            end
        })

        -- Go's gopls is configured and enabled by `navigator` (navigator.lua),
        -- so it is intentionally not listed here.
        -- Python: pip install pyright ruff   (or: npm i -g pyright)
        -- Ruby:   gem install solargraph
        -- PHP:    https://phpactor.readthedocs.io/en/master/usage/standalone.html#installation
        vim.lsp.enable({"pyright", "ruff", "solargraph", "phpactor"})
    end
}
