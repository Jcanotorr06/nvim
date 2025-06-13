return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "typescript",
        "javascript",
        "tsx",
        "json",
        "c_sharp",
        "xml",
      },
    },
  },

  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    cmd = "Copilot",
    event = "InsertEnter",
    -- opts = {
    --   suggestion = {
    --     auto_trigger = true,
    --     keymap = {
    --       accept = "<C-l>",
    --       accept_word = false,
    --       accept_line = false,
    --       next = "<C-j>",
    --       prev = "<C-k>",
    --       dismiss = "<C-/>",
    --     }
    --   }
    -- }
    config = function()
      require("copilot").setup {
        panel = {
          auto_refresh = false,
          keymap = {
            accept = "<CR>",
            jump_prev = "[[",
            jump_next = "]]",
            refresh = "gr",
            open = "<M-CR>",
          },
        },
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<M-l>",
            prev = "<M-[>",
            next = "<M-]>",
            dismiss = "<C-]>",
          },
        },
      }
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        fiile_ignore_patterns = {
          "node_modules",
          ".git",
          "dist",
        },
      },
    },
    config = function()
      require("telescope").setup {
        defaults = {
          fiile_ignore_patterns = {
            "node_modules",
            ".git",
            "dist",
          },
        },
      }
    end,
  },

  {
    "rmagatti/auto-session",
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { "~/", "/" },
      -- log_level = 'debug',
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      -- Custom Lualine component to show attached language server
      local clients_lsp = function()
        local bufnr = vim.api.nvim_get_current_buf()

        local clients = vim.lsp.get_clients()
        if next(clients) == nil then
          return ""
        end

        local c = {}
        for _, client in pairs(clients) do
          table.insert(c, client.name)
        end
        return " " .. table.concat(c, "|")
      end

      local custom_catppuccin = require "lualine.themes.seoul256"

      -- Custom colours
      -- custom_catppuccin.normal.b.fg = "#cad3f5"
      -- custom_catppuccin.insert.b.fg = "#cad3f5"
      -- custom_catppuccin.visual.b.fg = "#cad3f5"
      -- custom_catppuccin.replace.b.fg = "#cad3f5"
      -- custom_catppuccin.command.b.fg = "#cad3f5"
      -- custom_catppuccin.inactive.b.fg = "#cad3f5"
      --
      -- custom_catppuccin.normal.c.fg = "#6e738d"
      -- custom_catppuccin.normal.c.bg = "#1e2030"

      require("lualine").setup {
        options = {
          theme = custom_catppuccin,
          component_separators = "",
          section_separators = { left = "", right = "" },
          disabled_filetypes = { "alpha", "Outline" },
        },
        sections = {
          lualine_a = {
            { "mode", separator = { left = " ", right = "" }, icon = "" },
          },
          lualine_b = {
            {
              "filetype",
              icon_only = true,
              padding = { left = 1, right = 0 },
            },
            "filename",
          },
          lualine_c = {
            {
              "branch",
              icon = "",
            },
            {
              "diff",
              symbols = { added = " ", modified = " ", removed = " " },
              colored = false,
            },
          },
          lualine_x = {
            {
              "diagnostics",
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
              update_in_insert = true,
            },
          },
          lualine_y = { clients_lsp },
          lualine_z = {
            { "location", separator = { left = "", right = " " }, icon = "" },
          },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "location" },
        },
        extensions = { "toggleterm", "trouble" },
      }
    end,
  },

  {
    'VonHeikemen/fine-cmdline.nvim',
    lazy = false,
    dependencies = {
      { 'MunifTanjim/nui.nvim' }
    }
  }
}
