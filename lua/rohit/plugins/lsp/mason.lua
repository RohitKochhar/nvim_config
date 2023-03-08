-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
    "clangd",
    -- "docker-compose-language-service",
    -- "bash-language-server", 
    -- "dockerfile-language-server",
    -- "dot-language-server",
    "golangci_lint_ls",
    "gopls",
    -- "jsonls",
    "ltex",
    "texlab",
    "lua_ls",
    "marksman",
    -- "nil_ls",
    -- "jedi_language_server",
    "terraformls",
    -- "yamlls",
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
  -- list of formatters & linters for mason to install
  ensure_installed = {
    "golangci_lint_ls",
    "gopls",
  
    -- "prettier", -- ts/js formatter
    -- "stylua", -- lua formatter
    -- "eslint_d", -- ts/js linter
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
})
