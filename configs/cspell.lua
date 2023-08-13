local cspell_path = vim.fn.expand "$HOME/.config/nvim/lua/custom/cspell/cspell.json"

local cspell_config = {
  find_json = function()
    return cspell_path
  end,
}

return cspell_config
