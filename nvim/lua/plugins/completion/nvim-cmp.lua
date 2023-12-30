return {
  "hrsh7th/nvim-cmp",
  event="InsertEnter",
  dependencies={
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp"
  },
  config=function()
    require("cmp").setup({
      sources = {
        { name = "buffer" }
      }
    })
  end
}

