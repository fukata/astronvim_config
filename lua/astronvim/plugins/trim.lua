return {
  "cappyzawa/trim.nvim",
  lazy = false,
  config = function()
    -- https://zenn.dev/abcd/articles/1835a7bd1c7db5
    require("trim").setup({
      trim_last_line = false,
      patterns = {
        [[%s/\n*\%$/\r/]],
      },
    })
  end
}
