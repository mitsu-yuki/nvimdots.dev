return function()
  ---@type lazydev.Config
  require("lazydev").setup({
    library = {
      {path = "${3rd}/luv/library", words = {"vim%.uv"}},
    },
  })
end
