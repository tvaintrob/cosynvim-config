return {
  'nvim-treesitter/nvim-treesitter',
  event = 'LazyFile',
  cmd = 'TSUpdate',
  build = ':TSUpdate',
  dependencies = {
    { 'windwp/nvim-ts-autotag' },
    { 'RRethy/nvim-treesitter-endwise' },
    { 'joosepalviste/nvim-ts-context-commentstring' },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
  },
  opts = {
    auto_install = true,
    ensure_installed = 'all',
    ignore_install = { 'wing' },
    indent = { enable = true },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    autotag = {
      enable = true,
      enable_close_on_slash = false,
    },
    endwise = { enable = true },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['af'] = { query = '@function.outer', desc = 'around a function' },
          ['if'] = { query = '@function.inner', desc = 'inner part of a function' },
          ['ac'] = { query = '@class.outer', desc = 'around a class' },
          ['ic'] = { query = '@class.inner', desc = 'inner part of a class' },
          ['ai'] = { query = '@conditional.outer', desc = 'around an if statement' },
          ['ii'] = { query = '@conditional.inner', desc = 'inner part of an if statement' },
          ['al'] = { query = '@loop.outer', desc = 'around a loop' },
          ['il'] = { query = '@loop.inner', desc = 'inner part of a loop' },
          ['ap'] = { query = '@parameter.outer', desc = 'around parameter' },
          ['ip'] = { query = '@parameter.inner', desc = 'inside a parameter' },
        },
        selection_modes = {
          ['@parameter.outer'] = 'v', -- charwise
          ['@parameter.inner'] = 'v', -- charwise
          ['@function.outer'] = 'v', -- charwise
          ['@conditional.outer'] = 'V', -- linewise
          ['@loop.outer'] = 'V', -- linewise
          ['@class.outer'] = '<c-v>', -- blockwise
        },
        include_surrounding_whitespace = false,
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_previous_start = {
          ['[p'] = { query = '@parameter.inner', desc = 'Previous parameter' },
          ['[f'] = { query = '@function.outer', desc = 'Previous function' },
          ['[c'] = { query = '@class.outer', desc = 'Previous class' },
        },
        goto_next_start = {
          [']f'] = { query = '@function.outer', desc = 'Next function' },
          [']c'] = { query = '@class.outer', desc = 'Next class' },
          [']p'] = { query = '@parameter.inner', desc = 'Next parameter' },
        },
      },
    },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
