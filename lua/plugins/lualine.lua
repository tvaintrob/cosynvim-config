local function lsp_server_names()
  local servers = vim.lsp.get_active_clients({ bufnr = 0 })
  local names = ''

  for _, server in ipairs(servers) do
    names = names .. ' [' .. server.name .. ']'
  end

  return names
end

return {
  'nvim-lualine/lualine.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' },
    { 'lunarvim/darkplus.nvim' },
    { 'AndreM222/copilot-lualine' },
    {
      'SmiteshP/nvim-navic',
      config = function()
        require('nvim-navic').setup({
          highlight = true,
          icons = {
            File = ' ',
            Module = ' ',
            Namespace = ' ',
            Package = ' ',
            Class = ' ',
            Method = ' ',
            Property = ' ',
            Field = ' ',
            Constructor = ' ',
            Enum = ' ',
            Interface = ' ',
            Function = ' ',
            Variable = ' ',
            Constant = ' ',
            String = ' ',
            Number = ' ',
            Boolean = ' ',
            Array = ' ',
            Object = ' ',
            Key = ' ',
            Null = ' ',
            EnumMember = ' ',
            Struct = ' ',
            Event = ' ',
            Operator = ' ',
            TypeParameter = ' ',
          },
          lsp = { auto_attach = true },
        })
      end,
    },
  },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'darkplus',
        section_separators = '',
        component_separators = '',
      },
      sections = {
        lualine_c = { 'filename', 'navic' },
        lualine_x = { lsp_server_names, 'encoding', { 'copilot', show_colors = true, show_loading = true }, 'filetype' },
      },
    })
  end,
}
