local bloody = {
  [[                                                     ]],
  [[  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ]],
  [[  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ]],
  [[ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ]],
  [[ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ]],
  [[ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ]],
  [[ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ]],
  [[ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ]],
  [[    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ]],
  [[          ░    ░  ░    ░ ░        ░   ░         ░    ]],
  [[                                 ░                   ]],
  [[                                                     ]],
  [[                                                     ]],
}
return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require("indent_blankline.commands").disable()
    require('dashboard').setup {
      -- config
      theme = "hyper",
      config = {
        header = bloody
      }

    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
