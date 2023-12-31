return {
  "hrsh7th/nvim-cmp",
  event={"InsertEnter"},
  dependencies={
    { "hrsh7th/cmp-cmdline", event={"CmdLineEnter"}},
    { "neovim/nvim-lspconfig", event={"InsertEnter"}},
    { "hrsh7th/cmp-nvim-lsp", event={"InsertEnter"}},
    { "hrsh7th/cmp-buffer", event={"InsertEnter"}},
    { "hrsh7th/cmp-path", event={"InsertEnter"}},
    { "hrsh7th/nvim-cmp", event={"InsertEnter"}},
  },

  config=function()
    local cmp = require "cmp"

    local generalSources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    }

    local searchSources = {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    }

    local pathSources = {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
    }

    cmp.setup({sources = cmp.config.sources(generalSources)})
    cmp.setup.cmdline('/', searchSources)
    cmp.setup.cmdline(':', pathSources)
  end
}

