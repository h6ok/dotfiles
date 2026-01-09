require("h6ok.core")
require("h6ok.lazy")

-- ターミナルモードでEscを押したらノーマルモードに戻る
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- tfファイルのコメント設定
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "terraform", "hcl" },
  callback = function()
    vim.bo.commentstring = "# %s"
  end,
})
