return function()
  local ollama_host = os.getenv("OLLAMA_HOST")
  ---@param model_name string
  local ollama_model = function(model_name)
    ---@type AvanteSupportedProvider
    return {
      __inherited_from = "openai",
      api_key_name = "",
      endpoint = ollama_host .. "/v1",
      model = model_name,
      max_token = 8192,
    }
  end
  ---@type avante.Config
  require("avante").setup({
    provider = "ollama_qwen",
    auto_suggestions_provider = "ollama_phi4",
    vendors = {
      ["ollama_qwen"] = ollama_model("qwen2.5-coder:latest"),
      ["ollama_marco"] = ollama_model("marco-o1:latest"),
      ["ollama_deepseek"] = ollama_model("deepseek-coder:6.7b"),
      ["ollama_gemma2"] = ollama_model("gemma2:latest"),
      ["ollama_phi4"] = ollama_model("phi4:latest"),
    },
    behaviour = {
      auto_suggestions = false,
    },
    windows = {
      position = "left",
      wrap = true,
      sidebar_header = {
        align = "center",
        rounded = true,
      },
      ask = {
        floating = true,
      },
    },
    mappings = {
      suggestion = {
        accept = "<leader><Tab>",
        next = "<leader>]",
        prev = "<leader>[",
        dismiss = "<leader>q",
      },
    },
  })
end
