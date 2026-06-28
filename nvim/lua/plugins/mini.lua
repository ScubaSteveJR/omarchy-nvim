return {
  -- Mini Nvim
  { "nvim-mini/mini.nvim", version = false },

  -- File explorer (works properly with oil unlike nvim-tree)
  {
    "nvim-mini/mini.files",
    config = function()
      local MiniFiles = require("mini.files")
      MiniFiles.setup({
        windows = {
          side = "right",
        },
        mappings = {
          go_in = "<CR>",
          go_in_plus = "L",
          go_out = "-",
          go_out_plus = "H",
        },
      })
      vim.keymap.set("n", "<leader>ee", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })
      vim.keymap.set("n", "<leader>ef", function()
        MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
        MiniFiles.reveal_cwd()
      end, { desc = "Toggle into currently opened file" })

      -- Open mini.files if opening a directory
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          local arg = vim.fn.argv(0)
          if arg ~= "" and vim.fn.isdirectory(arg) == 1 then
            MiniFiles.open(arg)
          end
        end,
      })
    end,
  },
}
