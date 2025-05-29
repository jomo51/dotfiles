local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
  setup = function()
    -- DOTFILES_HOME > HOME > expand("~") の順でパス決定
    local home = vim.env.HOME or vim.fn.expand("~")
    local dotfiles_root = vim.env.DOTFILES_HOME or (home .. "/dotfiles")
    local bundle_path = dotfiles_root .. "/tools/pses/PowerShellEditorServices"
    bundle_path = bundle_path:gsub("\\", "/")

    -- セッションファイルの出力先をNeovimのキャッシュディレクトリに変更
    local session_file = vim.fn.stdpath("cache") .. "/powershell_es_session.json"
    session_file = session_file:gsub("\\", "/")
    

    if not configs.powershell_es then
      configs.powershell_es = {
        default_config = {
          cmd = {
            "pwsh",
            "-NoLogo",
            "-NoProfile",
            "-File",
            bundle_path .. "/Start-EditorServices.ps1",
            "-HostName", "nvim",
            "-HostProfileId", "neovim",
            "-HostVersion", "1.0.0",
            "-BundledModulesPath", bundle_path,
            "-EnableConsoleRepl:$false",
             "-SessionDetailsPath", session_file,
            "-Stdio"
          },
          filetypes = { "powershell" },
          --root_dir = lspconfig.util.root_pattern(".git", ".ps1proj", ".editorconfig") or vim.fn.getcwd(),
          -- .gitや.ps1proj等が見つからなければ getcwd() にフォールバック
          root_dir = function(fname) 
            return lspconfig.util.root_pattern(".git", ".ps1proj", ".editorconfig")(fname) or vim.fn.getcwd()
          end,
          capabilities = capabilities,
        },
      }
    end

    lspconfig.powershell_es.setup({})
  end
}

