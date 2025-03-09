local ft = {}
-- filetype config
ft.js_like = {
  "javascript",
  "typescript",
}

ft.js_framework_like = vim
  .iter({
    ft.js_like,
    {
      "svelte",
      "vue",
    },
  })
  :flatten(math.huge)
  :totable()

ft.sh_like = {
  "sh",
  "bash",
  "zsh",
}

ft.yaml_like = {
  "yml",
  "yaml",
  "yaml.gitlab",
  "yaml.ansible",
}

return ft
