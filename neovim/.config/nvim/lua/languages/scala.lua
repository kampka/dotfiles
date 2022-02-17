local M = {}

M.setup = function()
  local cmd = vim.cmd
  vim.opt_global.shortmess:remove("F")
  Metals_config = require("metals").bare_config()

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  Metals_config.settings = {
    showImplicitArguments = true,
    showInferredType = true,
    excludedPackages = {
      "akka.actor.typed.javadsl",
      "com.github.swagger.akka.javadsl",
      "akka.stream.javadsl",
    },
    serverProperties = {
      "-Xms4G",
      "-Xmx4G",
    },
    --fallbackScalaVersion = "2.13.6",
  }

  Metals_config.init_options.statusBarProvider = "on"
  Metals_config.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

  local dap = require("dap")

  dap.configurations.scala = {
    {
      type = "scala",
      request = "launch",
      name = "Run",
      metals = {
        runType = "run",
        args = { "firstArg", "secondArg", "thirdArg" },
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "Test File",
      metals = {
        runType = "testFile",
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "Test Target",
      metals = {
        runType = "testTarget",
      },
    },
  }

  Metals_config.on_attach = function(client, bufnr)
    vim.cmd([[autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()]])
    vim.cmd([[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])
    vim.cmd([[autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()]])

    require("metals").setup_dap()
  end
  cmd([[augroup scalalsp]])
  cmd([[autocmd!]])
  cmd([[autocmd FileType scala,sbt,java lua require("metals").initialize_or_attach(Metals_config)]])
  cmd([[augroup END]])
end

return M
