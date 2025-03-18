return {
  {
    "kblin/vim-fountain",
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    Event = "VeryLazy",
    ft = "markdown",
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      "BufReadPre " .. vim.fn.expand("~/Docs/Obsidian/Vault/**.md"),
      "BufNewFile " .. vim.fn.expand("~/Docs/Obsidian/Vault/**.md"),
    },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      -- Optional, for search and completion
      "nvim-telescope/telescope.nvim",
      -- Optional, for completion
      "hrsh7th/nvim-cmp",
    },
    opts = {
      workspaces = {
        {
          name = "vault",
          path = "~/Docs/Obsidian/Vault",
        },
      },

      daily_notes = {
        folder = "daily",
        date_format = "%Y-%m-%d",
      },

      completion = {
        nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
      },

      note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,

      disable_frontmatter = false,

      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },

      follow_url_func = function(url)
        vim.fn.jobstart({ "open", url }) -- Mac OS
      end,
    },
  },
}
