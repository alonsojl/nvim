# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration written in Lua, using [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management. Go is the primary target language and gets the heaviest tooling.

## How config loads

- `init.lua` requires two modules in order: `alonsojl.default` then `alonsojl.lazy`.
- `lua/alonsojl/default.lua` — global options (leader is `,`), core keymaps (window nav `<C-hjkl>`, resize, save `<C-s>`), and the `LspAttach` autocmd that binds `gh` to hover.
- `lua/alonsojl/lazy.lua` — bootstraps lazy.nvim and imports the entire `alonsojl.plugins` directory. Update checking and config change detection are both disabled.
- `lua/alonsojl/plugins/*.lua` — one file per plugin (or related group). Each file `return`s a lazy.nvim spec (a table, or a list of tables). Adding a new `.lua` file here is all that's needed to register a plugin; no central registry to edit.
- `lazy-lock.json` is the lockfile — let lazy.nvim manage it; don't hand-edit.

## Applying and verifying changes

There is no build/test/lint step. To exercise changes, restart Neovim (or `:source` the file) and use lazy.nvim commands:

- `:Lazy` — open the plugin manager UI
- `:Lazy sync` — install/update/clean to match specs
- `:checkhealth` — diagnose plugin/runtime issues

A quick headless smoke test that config parses without errors:

```
nvim --headless "+Lazy! sync" +qa
```

## LSP architecture (important — split across two files)

LSP setup is intentionally divided, so changing one server means knowing which file owns it:

- **Go** LSP (`gopls`) is configured by **`plugins/navigator.lua`** via `ray-x/navigator.lua` + `ray-x/go.nvim` (`format_on_save` enabled). Do **not** also register `gopls` in `cmp.lua`.
- **All other servers** (`pyright`, `solargraph`, `phpactor`) are enabled in **`plugins/cmp.lua`** via the native `vim.lsp.config` / `vim.lsp.enable` API (Neovim 0.11+); nvim-lspconfig is kept only to ship the default server configs under `lsp/`.
- `plugins/cmp.lua` also owns the completion stack (nvim-cmp + cmp-nvim-lsp + lspkind) and the LuaSnip snippet engine.

Language servers are external binaries the user installs manually (see `README.md`): `gopls`, `pyright`, `solargraph`, `phpactor`.

## Snippets — two engines coexist

- **LuaSnip** (+ friendly-snippets) drives nvim-cmp completion (`plugins/cmp.lua`).
- **UltiSnips** is used specifically by `vim-go` (`plugins/vim-go.lua`, `go_snippet_engine = "ultisnips"`, expand on `<S-Tab>`).

## Go workflow keymaps (filetype `go` only, from `navigator.lua`)

`<C-i>` GoImport · `<C-b>` GoBuild · `<C-t>` GoTestPkg · `<C-c>` GoCoverage · `A`/`V`/`S` switch to alternate (test) file in same window / vsplit / split.

## Conventions

- Indentation is **3 spaces** (`tabstop`/`shiftwidth` = 3, `expandtab`), enforced for editing Lua here too.
- `textwidth`/`colorcolumn` = 120.
- Plugin specs use folke/lazy.nvim table style; prefer a `config = function() ... end` block for setup and keep per-plugin keymaps inside that plugin's file.
