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

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.java",
	callback = function()
		-- 標準のLSPコマンドでインポート整理を実行
		vim.lsp.buf.code_action({
			context = { only = { "source.organizeImports" } },
			apply = true,
		})
	end,
})

-- javaファイル専用の設定
vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		vim.opt_local.expandtab = true -- タブをスペースに変換
		vim.opt_local.tabstop = 4 -- タブをスペース4つ分として表示
		vim.opt_local.shiftwidth = 4 -- 自動インデントの幅を4にする
		vim.opt_local.softtabstop = 4 -- 入力時のタブ幅を4にする
	end,
})
