local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end
require"nvim-treesitter.configs".setup {
  ensure_installed = { "c", "lua", "rust" },
  sync_install = true,
  ignore_install = { "javascript" },

  highlight = {
    enable = true,
    disable = { "c", "rust" },
    additional_vim_regex_highlighting = false,
  },
}
