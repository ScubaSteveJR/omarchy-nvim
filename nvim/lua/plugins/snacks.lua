return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    scroll = {
      enabled = false, -- Disable scrolling animations
    },
    picker = {
      layout = "ivy",
      sources = {
        gh_issue = {},
        gh_pr = {},
        gh_diff = {},
        smart = {},
        grep = {},
      },
      win = {
        input = {
          keys = {
            ["p"] = { "focus_preview", mode = { "n", "x" } },
          },
        },
      },
      matcher = {
        frecency = true,
      },
    },
  },

  keys = {
    {
      "<leader><space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>lg",
      function()
        require("snacks").lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>gl",
      function()
        require("snacks").lazygit.log()
      end,
      desc = "Lazygit Logs",
    },
    {
      "<leader>es",
      function()
        require("snacks").explorer()
      end,
      desc = "Open Snacks Explorer",
    },
    {
      "<leader>rN",
      function()
        require("snacks").rename.rename_file()
      end,
      desc = "Fast Rename Current File",
    },
    {
      "<leader>dB",
      function()
        require("snacks").bufdelete()
      end,
      desc = "Delete or Close Buffer (Confirm)",
    },
  },
}
