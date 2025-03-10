return function()
  ---@type HlChunk.UserConf
  require("hlchunk").setup({
    chunk = {
      enable = true,
      delay = 0,
    },
    indent = {
      enable = true,
    },
  })
end
