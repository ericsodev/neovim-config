return {

  'saghen/blink.cmp',
  ---@module 'blink.cmp'
  -- optional: provides snippets for the snippet source
  -- dependencies = 'rafamadriz/friendly-snippets',

  dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },

  -- use a release tag to download pre-built binaries
  version = 'v0.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- see the "default configuration" section below for full documentation on how to define
    -- your own keymap.
    keymap = {
      preset = 'default',
      ['<C-j>'] = { 'show' },
    },
    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
    },
    snippets = {
      preset = 'luasnip',
      expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
      active = function(filter)
        if filter and filter.direction then
          return require('luasnip').jumpable(filter.direction)
        end
        return require('luasnip').in_snippet()
      end,
      jump = function(direction) require('luasnip').jump(direction) end,
    },

    -- default list of enabled providers defined so that you can extend it elsewhere in your config, without redefining it, via `opts_extend`
    sources = {
      default = { 'lsp', 'snippets', 'buffer' },
      -- optionally disable cmdline completions
      -- cmdline = {},
    },
    completion = {
      menu = {
        border = 'padded',
        draw = {
          columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 }, { 'kind', 'source_name', gap = 1 } },
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx) return ctx.kind_icon .. ctx.icon_gap end,
              highlight = function(ctx) return require('blink.cmp.completion.windows.render.tailwind').get_hl(ctx) or 'BlinkCmpKind' .. ctx.kind end,
            },

            kind = {
              ellipsis = false,
              width = { fill = true },
              text = function(ctx) return ctx.kind end,
              highlight = function(ctx) return require('blink.cmp.completion.windows.render.tailwind').get_hl(ctx) or 'BlinkCmpKind' .. ctx.kind end,
            },
            label = {
              width = { fill = true, max = 45 },
              text = function(ctx) return ctx.label .. ctx.label_detail end,
              highlight = function(ctx)
                -- label and label details
                local highlights = {
                  { 0, #ctx.label, group = ctx.deprecated and 'BlinkCmpLabelDeprecated' or 'BlinkCmpLabel' },
                }
                if ctx.label_detail then
                  table.insert(highlights, { #ctx.label, #ctx.label + #ctx.label_detail, group = 'BlinkCmpLabelDetail' })
                end

                -- characters matched on the label by the fuzzy matcher
                for _, idx in ipairs(ctx.label_matched_indices) do
                  table.insert(highlights, { idx, idx + 1, group = 'BlinkCmpLabelMatch' })
                end

                return highlights
              end,
            },
            label_description = {
              width = { max = 30 },
              text = function(ctx) return ctx.label_description end,
              highlight = 'BlinkCmpLabelDescription',
            },

            source_name = {
              width = { max = 30 },
              -- source_name or source_id are supported
              text = function(ctx) return ctx.source_name end,
              highlight = 'BlinkCmpSource',
            },
          },
        },
      },
      documentation = {
        -- Controls whether the documentation window will automatically show when selecting a completion item
        auto_show = true,
        -- Delay before showing the documentation window
        auto_show_delay_ms = 250,
        -- Delay before updating the documentation window when selecting a new item,
        -- while an existing item is still visible
        update_delay_ms = 50,
        -- Whether to use treesitter highlighting, disable if you run into performance issues
        treesitter_highlighting = true,
        window = {
          min_width = 10,
          max_width = 60,
          max_height = 20,
          border = 'padded',
          winblend = 0,
          winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
          -- Note that the gutter will be disabled when border ~= 'none'
          scrollbar = true,
          -- Which directions to show the documentation window,
          -- for each of the possible menu window directions,
          -- falling back to the next direction when there's not enough space
          direction_priority = {
            menu_north = { 'e', 'w', 'n', 's' },
            menu_south = { 'e', 'w', 's', 'n' },
          },
        },
      },
      -- Displays a preview of the selected item on the current line
      ghost_text = {
        enabled = false,
      },
    },

    -- experimental signature help support
    signature = {
      enabled = true,
      -- trigger = {
      --   blocked_trigger_characters = {},
      --   blocked_retrigger_characters = {},
      --   -- When true, will show the signature help window when the cursor comes after a trigger character when entering insert mode
      --   show_on_insert_on_trigger_character = true,
      -- },
      window = {
        min_width = 1,
        max_width = 100,
        max_height = 10,
        border = 'padded',
        winblend = 0,
        winhighlight = 'Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder',
        scrollbar = false, -- Note that the gutter will be disabled when border ~= 'none'
        -- Which directions to show the window,
        -- falling back to the next direction when there's not enough space,
        -- or another window is in the way
        direction_priority = { 'n', 's' },
        -- Disable if you run into performance issues
        treesitter_highlighting = true,
      },
    },
  },
  -- allows extending the providers array elsewhere in your config
  -- without having to redefine it
  opts_extend = { 'sources.default' },
}
