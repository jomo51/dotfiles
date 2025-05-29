-- ファイルタイプの紐づけを行う設定ファイル

-- PowerShellスクリプト用
vim.filetype.add({
  extension = {
    ps1 = "powershell",   --  powershell本体
    psm1 = "powershell",  --  モジュールファイル
    psd1 = "powershell",  --  モジュールマニフェスト
  },
  filename = {
    -- ["hogehoge.foo1"] = "powershell",  --ファイル名対応
  },
})
