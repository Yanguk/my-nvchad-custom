local M = {}

local function get_eslint_settings()
  local eslint_settings = {}

  local yarn_path = vim.fn.getcwd() .. "/.yarn"
  local is_yarn_pnp = vim.fn.isdirectory(yarn_path) == 1

  if is_yarn_pnp then
    eslint_settings = {
      nodePath = vim.fn.getcwd() .. "/.yarn/sdks",
      packageManager = "yarn",
    }
  end

  return eslint_settings
end

M.eslint_settings = get_eslint_settings()

M.toggle_trailing_space = (function()
  local isHighlightEnabled = false

  function toggle()
    if isHighlightEnabled then
      vim.cmd "highlight clear ExtraWhitespace"
      vim.cmd "match none"
    else
      vim.cmd "highlight ExtraWhitespace ctermbg=red guibg=red"
      vim.cmd "match ExtraWhitespace /\\s\\+$/"
    end

    isHighlightEnabled = not isHighlightEnabled
  end

	return toggle
end)()

return M
