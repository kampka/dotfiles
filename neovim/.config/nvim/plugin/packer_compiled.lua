-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/chris/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/chris/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/chris/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/chris/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/chris/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["bufresize.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14bufresize\frequire\0" },
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/bufresize.nvim",
    url = "https://github.com/kwkarlwang/bufresize.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\nB\0\0\3\0\3\0\t6\0\0\0'\2\1\0B\0\2\0027\0\1\0006\0\1\0009\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rdressing\frequire\0" },
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["editorconfig.nvim"] = {
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/editorconfig.nvim",
    url = "https://github.com/gpanders/editorconfig.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nz\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\28current_line_blame_opts\1\0\0\1\0\1\18virt_text_pos\16right_align\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0" },
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n·\2\0\0\6\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0006\5\f\0>\5\2\4=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\3=\3\20\2B\0\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\3\0\0\rencoding\rfiletype\14lualine_c\18metals_status\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\2\ntheme\tnord\18icons_enabled\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mind.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tmind\frequire\0" },
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/mind.nvim",
    url = "https://github.com/phaazon/mind.nvim"
  },
  ["nord.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\21colorscheme nord\bcmd\bvim\0" },
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n∏\1\0\0\b\0\t\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\2\5\1\18\4\2\0009\2\6\2'\5\a\0009\6\b\0B\6\1\0A\2\2\1K\0\1\0\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_prev_item\fvisible¥\2\1\0\b\0\22\0!6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\a\0004\4\5\0005\5\3\0>\5\1\0045\5\4\0>\5\2\0045\5\5\0>\5\3\0045\5\6\0>\5\4\4=\4\b\0035\4\n\0003\5\t\0=\5\v\4=\4\f\0035\4\16\0009\5\r\0009\5\14\0055\a\15\0B\5\2\2=\5\17\0043\5\18\0=\5\19\0043\5\20\0=\5\21\4=\4\r\3B\1\2\0012\0\0ÄK\0\1\0\f<S-Tab>\0\n<Tab>\0\t<CR>\1\0\0\1\0\1\vselect\2\fconfirm\fmapping\fsnippet\vexpand\1\0\0\0\fsources\1\0\0\1\0\1\tname\tpath\1\0\1\tname\nvsnip\1\0\1\tname\vbuffer\1\0\2\rpriority\3\n\tname\rnvim_lsp\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-lsp-ts-utils"] = {
    config = { "\27LJ\2\nè\5\0\2\v\0\18\0#6\2\0\0'\4\1\0B\2\2\0029\3\2\0025\5\3\0005\6\4\0=\6\5\0054\6\0\0=\6\6\0054\6\0\0=\6\a\5B\3\2\0019\3\b\2\18\5\0\0B\3\2\0015\3\t\0006\4\n\0009\4\v\0049\4\f\4\18\6\1\0'\a\r\0'\b\14\0'\t\15\0\18\n\3\0B\4\6\0016\4\n\0009\4\v\0049\4\f\4\18\6\1\0'\a\r\0'\b\16\0'\t\17\0\18\n\3\0B\4\6\1K\0\1\0\24:TSLspImportAll<CR>\agi\23:TSLspOrganize<CR>\ags\6n\24nvim_buf_set_keymap\bapi\bvim\1\0\1\vsilent\2\17setup_client#filter_out_diagnostics_by_code'filter_out_diagnostics_by_severity\26import_all_priorities\1\0\4\14same_file\3\1\fbuffers\3\4\19buffer_content\3\3\16local_files\3\2\1\0\n enable_import_on_completion\1\23import_all_timeout\3à'\21disable_commands\1!require_confirmation_on_move\1\27update_imports_on_move\1\26inlay_hints_highlight\fComment\21auto_inlay_hints\2\ndebug\1\29import_all_select_source\1\28import_all_scan_buffers\3d\nsetup\22nvim-lsp-ts-utils\frequireÑ\2\1\0\b\0\f\0\0266\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\4Ä6\2\3\0'\4\4\0B\2\2\0012\0\15Ä6\2\1\0'\4\2\0B\2\2\0029\2\5\0029\2\6\0025\4\t\0006\5\1\0'\a\a\0B\5\2\0029\5\b\5=\5\b\0043\5\n\0=\5\v\4B\2\2\1K\0\1\0K\0\1\0\14on_attach\0\1\0\0\17init_options\22nvim-lsp-ts-utils\nsetup\rtsserver?Typescript dependends on lsp. The functionality is disable\nprint\14lspconfig\frequire\npcall\0" },
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nù\t\0\0\b\0,\0b6\0\0\0'\2\1\0B\0\2\0029\1\2\0006\2\4\0009\2\5\2'\4\6\0009\5\2\0009\5\3\0055\6\a\0006\a\b\0=\a\b\6B\2\4\2=\2\3\0015\1\t\0006\2\4\0009\2\n\0029\2\v\0026\3\4\0009\3\n\0039\3\r\0036\5\4\0009\5\n\0059\5\v\0059\5\14\5\18\6\1\0B\3\3\2=\3\f\0026\2\0\0'\4\15\0B\2\2\0029\2\16\2\18\3\2\0'\5\17\0'\6\18\0'\a\19\0B\3\4\1\18\3\2\0'\5\17\0'\6\20\0'\a\21\0B\3\4\1\18\3\2\0'\5\17\0'\6\22\0'\a\23\0B\3\4\1\18\3\2\0'\5\17\0'\6\24\0'\a\25\0B\3\4\1\18\3\2\0'\5\17\0'\6\26\0'\a\27\0B\3\4\1\18\3\2\0'\5\17\0'\6\28\0'\a\29\0B\3\4\1\18\3\2\0'\5\17\0'\6\30\0'\a\31\0B\3\4\1\18\3\2\0'\5\17\0'\6 \0'\a!\0B\3\4\1\18\3\2\0'\5\17\0'\6\"\0'\a#\0B\3\4\1\18\3\2\0'\5\17\0'\6$\0'\a%\0B\3\4\1\18\3\2\0'\5\17\0'\6&\0'\a'\0B\3\4\1\18\3\2\0'\5\17\0'\6(\0'\a)\0B\3\4\1\18\3\2\0'\5\17\0'\6*\0'\a+\0B\3\4\1K\0\1\0*<cmd>lua vim.lsp.buf.formatting()<CR>\14<leader>o(<cmd>lua vim.lsp.codelens.run()<CR>\15<leader>cl@<cmd>lua vim.diagnostic.open_float(0, {scope = \"line\"})<CR>\15<leader>ld,<cmd>lua vim.diagnostic.goto_prev()<CR>\15<leader>pd,<cmd>lua vim.diagnostic.goto_next()<CR>\15<leader>nd-<cmd>lua vim.diagnostic.setloclist()<CR>\14<leader>d+<cmd>lua vim.lsp.buf.code_action()<CR>\15<leader>ca&<cmd>lua vim.lsp.buf.rename()<CR>\15<leader>rn*<cmd>lua vim.lsp.buf.references()<CR>\agr.<cmd>lua vim.lsp.buf.implementation()<CR>\agi.<cmd>lua vim.lsp.buf.signature_help()<CR>\15<leader>sh%<cmd>lua vim.lsp.buf.hover()<CR>\6K*<cmd>lua vim.lsp.buf.definition()<CR>\agD\6n\bmap\16..functions\nhover\twith\23textDocument/hover\rhandlers\blsp\1\0\1\vborder\vsingle\17capabilities\1\0\0\nforce\15tbl_extend\bvim\19default_config\tutil\14lspconfig\frequire\0" },
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-metals"] = {
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/nvim-metals",
    url = "https://github.com/scalameta/nvim-metals"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nı\2\0\0\5\0\20\0\0266\0\0\0'\2\1\0B\0\2\0025\1\3\0=\1\2\0006\0\0\0'\2\4\0B\0\2\0029\0\5\0005\2\t\0005\3\6\0005\4\a\0=\4\b\3=\3\n\0024\3\0\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\19ignore_install\1\2\0\0\tnorg\21ensure_installed\17query_linter\1\0\0\16lint_events\1\3\0\0\rBufWrite\15CursorHold\1\0\2\venable\2\21use_virtual_text\2\nsetup\28nvim-treesitter.configs\1\2\0\0\bzig\14compilers\28nvim-treesitter.install\frequire\0" },
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["other.nvim"] = {
    config = { "\27LJ\2\n∏\1\0\0\5\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0004\3\3\0005\4\3\0>\4\1\3=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\0\1\0\3\fcontext\ttest\fpattern%/src/main/scala/(.*)/(.*).scala$\vtarget$/src/test/scala/%1/%2Spec.scala\nsetup\15other-nvim\frequire\0" },
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/other.nvim",
    url = "https://github.com/rgroli/other.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["scala-utils.nvim"] = {
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/scala-utils.nvim",
    url = "https://github.com/ckipp01/scala-utils.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope-undo.nvim"] = {
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/telescope-undo.nvim",
    url = "https://github.com/debugloop/telescope-undo.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n±\v\0\0\t\0003\0h6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\0025\4\22\0005\5\6\0005\6\5\0=\6\a\0056\6\0\0'\b\b\0B\6\2\0029\6\t\0069\6\n\6=\6\v\0056\6\0\0'\b\b\0B\6\2\0029\6\f\0069\6\n\6=\6\r\0055\6\17\0005\a\15\0009\b\14\1=\b\16\a=\a\18\0065\a\19\0009\b\14\1=\b\16\a=\a\20\6=\6\21\5=\5\23\0045\5\29\0005\6\24\0005\a\26\0005\b\25\0=\b\27\a=\a\28\6=\6\30\5=\5\31\4B\2\2\0016\2\0\0'\4\3\0B\2\2\0029\2 \2'\4!\0B\2\2\0016\2\0\0'\4\3\0B\2\2\0029\2 \2'\4\"\0B\2\2\0016\2\0\0'\4\3\0B\2\2\0029\2 \2'\4\30\0B\2\2\0016\2\0\0'\4#\0B\2\2\0029\2$\2\18\3\2\0'\5\20\0'\6%\0'\a&\0B\3\4\1\18\3\2\0'\5\20\0'\6'\0'\a(\0B\3\4\1\18\3\2\0'\5\20\0'\6)\0'\a*\0B\3\4\1\18\3\2\0'\5\20\0'\6+\0'\a,\0B\3\4\1\18\3\2\0'\5\20\0'\6-\0'\a.\0B\3\4\1\18\3\2\0'\5\20\0'\6/\0'\a0\0B\3\4\1\18\3\2\0'\5\20\0'\0061\0'\a2\0B\3\4\1K\0\1\0=<cmd>lua require(\"telescope\").extensions.undo.undo()<CR>\14<leader>uN<cmd>lua require(\"telescope.builtin\").lsp_dynamic_workspace_symbols()<CR>\15<leader>wsE<cmd>lua require(\"telescope.builtin\").lsp_document_symbols()<CR>\15<leader>dsC<cmd>lua require(\"telescope\").extensions.metals.commands()<CR>\15<leader>mcW<cmd>lua require\"telescope.builtin\".file_browser({layout_strategy=\"vertical\"})<CR>\15<leader>fbT<cmd>lua require\"telescope.builtin\".live_grep({layout_strategy=\"vertical\"})<CR>\15<leader>lgU<cmd>lua require\"telescope.builtin\".find_files({layout_strategy=\"vertical\"})<CR>\15<leader>ff\bmap\16..functions\14ui-select\15fzy_native\19load_extension\15extensions\tundo\1\0\0\18layout_config\rvertical\1\0\0\1\0\1\19preview_cutoff\3\0\1\0\2\20layout_strategy\rvertical\17side_by_side\2\rdefaults\1\0\0\rmappings\6n\1\0\0\6i\1\0\0\n<c-t>\1\0\0\22open_with_trouble\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\25file_ignore_patterns\1\0\1\18prompt_prefix\b‚ùØ\1\5\0\0\vtarget\17node_modules\rparser.c\bout\nsetup\14telescope trouble.providers.telescope\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nƒ\2\0\0\6\0\v\0\0236\0\0\0'\2\1\0B\0\2\0027\0\1\0006\0\1\0009\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\0\5\0\18\1\0\0'\3\6\0'\4\a\0'\5\b\0B\1\4\1\18\1\0\0'\3\6\0'\4\t\0'\5\n\0B\1\4\1K\0\1\0P<cmd>lua require(\"trouble\").previous({skip_groups = true, jump = true})<CR>\15<leader>tpL<cmd>lua require(\"trouble\").next({skip_groups = true, jump = true})<CR>\15<leader>tn\6n\bmap\16..functions\1\0\1\15auto_close\2\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-hardtime"] = {
    config = { "\27LJ\2\n5\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\24hardtime_default_on\6g\bvim\0" },
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/vim-hardtime",
    url = "https://github.com/takac/vim-hardtime"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-tmux-navigator"] = {
    config = { "\27LJ\2\nÔ\2\0\0\a\0\16\0\0316\0\0\0009\0\1\0)\1\1\0=\1\2\0)\1\1\0=\1\3\0006\1\4\0'\3\5\0B\1\2\0029\1\6\1\18\2\1\0'\4\a\0'\5\b\0'\6\t\0B\2\4\1\18\2\1\0'\4\a\0'\5\n\0'\6\v\0B\2\4\1\18\2\1\0'\4\a\0'\5\f\0'\6\r\0B\2\4\1\18\2\1\0'\4\a\0'\5\14\0'\6\15\0B\2\4\1K\0\1\0\31<cmd>:TmuxNavigateDown<CR>\r<C-Down>\29<cmd>:TmuxNavigateUp<CR>\v<C-Up> <cmd>:TmuxNavigateRight<CR>\14<C-Right>\31<cmd>:TmuxNavigateLeft<CR>\r<C-Left>\6n\bmap\16..functions\frequire'tmux_navigator_disable_when_zoomed\31tmux_navigator_no_mappings\6g\bvim\0" },
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/chris/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0", "config", "leap.nvim")
time([[Config for leap.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n±\v\0\0\t\0003\0h6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\0025\4\22\0005\5\6\0005\6\5\0=\6\a\0056\6\0\0'\b\b\0B\6\2\0029\6\t\0069\6\n\6=\6\v\0056\6\0\0'\b\b\0B\6\2\0029\6\f\0069\6\n\6=\6\r\0055\6\17\0005\a\15\0009\b\14\1=\b\16\a=\a\18\0065\a\19\0009\b\14\1=\b\16\a=\a\20\6=\6\21\5=\5\23\0045\5\29\0005\6\24\0005\a\26\0005\b\25\0=\b\27\a=\a\28\6=\6\30\5=\5\31\4B\2\2\0016\2\0\0'\4\3\0B\2\2\0029\2 \2'\4!\0B\2\2\0016\2\0\0'\4\3\0B\2\2\0029\2 \2'\4\"\0B\2\2\0016\2\0\0'\4\3\0B\2\2\0029\2 \2'\4\30\0B\2\2\0016\2\0\0'\4#\0B\2\2\0029\2$\2\18\3\2\0'\5\20\0'\6%\0'\a&\0B\3\4\1\18\3\2\0'\5\20\0'\6'\0'\a(\0B\3\4\1\18\3\2\0'\5\20\0'\6)\0'\a*\0B\3\4\1\18\3\2\0'\5\20\0'\6+\0'\a,\0B\3\4\1\18\3\2\0'\5\20\0'\6-\0'\a.\0B\3\4\1\18\3\2\0'\5\20\0'\6/\0'\a0\0B\3\4\1\18\3\2\0'\5\20\0'\0061\0'\a2\0B\3\4\1K\0\1\0=<cmd>lua require(\"telescope\").extensions.undo.undo()<CR>\14<leader>uN<cmd>lua require(\"telescope.builtin\").lsp_dynamic_workspace_symbols()<CR>\15<leader>wsE<cmd>lua require(\"telescope.builtin\").lsp_document_symbols()<CR>\15<leader>dsC<cmd>lua require(\"telescope\").extensions.metals.commands()<CR>\15<leader>mcW<cmd>lua require\"telescope.builtin\".file_browser({layout_strategy=\"vertical\"})<CR>\15<leader>fbT<cmd>lua require\"telescope.builtin\".live_grep({layout_strategy=\"vertical\"})<CR>\15<leader>lgU<cmd>lua require\"telescope.builtin\".find_files({layout_strategy=\"vertical\"})<CR>\15<leader>ff\bmap\16..functions\14ui-select\15fzy_native\19load_extension\15extensions\tundo\1\0\0\18layout_config\rvertical\1\0\0\1\0\1\19preview_cutoff\3\0\1\0\2\20layout_strategy\rvertical\17side_by_side\2\rdefaults\1\0\0\rmappings\6n\1\0\0\6i\1\0\0\n<c-t>\1\0\0\22open_with_trouble\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\25file_ignore_patterns\1\0\1\18prompt_prefix\b‚ùØ\1\5\0\0\vtarget\17node_modules\rparser.c\bout\nsetup\14telescope trouble.providers.telescope\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: bufresize.nvim
time([[Config for bufresize.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14bufresize\frequire\0", "config", "bufresize.nvim")
time([[Config for bufresize.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n·\2\0\0\6\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0006\5\f\0>\5\2\4=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\3=\3\20\2B\0\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\3\0\0\rencoding\rfiletype\14lualine_c\18metals_status\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\2\ntheme\tnord\18icons_enabled\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nƒ\2\0\0\6\0\v\0\0236\0\0\0'\2\1\0B\0\2\0027\0\1\0006\0\1\0009\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\0\5\0\18\1\0\0'\3\6\0'\4\a\0'\5\b\0B\1\4\1\18\1\0\0'\3\6\0'\4\t\0'\5\n\0B\1\4\1K\0\1\0P<cmd>lua require(\"trouble\").previous({skip_groups = true, jump = true})<CR>\15<leader>tpL<cmd>lua require(\"trouble\").next({skip_groups = true, jump = true})<CR>\15<leader>tn\6n\bmap\16..functions\1\0\1\15auto_close\2\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: mind.nvim
time([[Config for mind.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tmind\frequire\0", "config", "mind.nvim")
time([[Config for mind.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n∏\1\0\0\b\0\t\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\2\5\1\18\4\2\0009\2\6\2'\5\a\0009\6\b\0B\6\1\0A\2\2\1K\0\1\0\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: other.nvim
time([[Config for other.nvim]], true)
try_loadstring("\27LJ\2\n∏\1\0\0\5\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0004\3\3\0005\4\3\0>\4\1\3=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\0\1\0\3\fcontext\ttest\fpattern%/src/main/scala/(.*)/(.*).scala$\vtarget$/src/test/scala/%1/%2Spec.scala\nsetup\15other-nvim\frequire\0", "config", "other.nvim")
time([[Config for other.nvim]], false)
-- Config for: nord.nvim
time([[Config for nord.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\21colorscheme nord\bcmd\bvim\0", "config", "nord.nvim")
time([[Config for nord.nvim]], false)
-- Config for: vim-hardtime
time([[Config for vim-hardtime]], true)
try_loadstring("\27LJ\2\n5\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\24hardtime_default_on\6g\bvim\0", "config", "vim-hardtime")
time([[Config for vim-hardtime]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
try_loadstring("\27LJ\2\nB\0\0\3\0\3\0\t6\0\0\0'\2\1\0B\0\2\0027\0\1\0006\0\1\0009\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rdressing\frequire\0", "config", "dressing.nvim")
time([[Config for dressing.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_prev_item\fvisible¥\2\1\0\b\0\22\0!6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\a\0004\4\5\0005\5\3\0>\5\1\0045\5\4\0>\5\2\0045\5\5\0>\5\3\0045\5\6\0>\5\4\4=\4\b\0035\4\n\0003\5\t\0=\5\v\4=\4\f\0035\4\16\0009\5\r\0009\5\14\0055\a\15\0B\5\2\2=\5\17\0043\5\18\0=\5\19\0043\5\20\0=\5\21\4=\4\r\3B\1\2\0012\0\0ÄK\0\1\0\f<S-Tab>\0\n<Tab>\0\t<CR>\1\0\0\1\0\1\vselect\2\fconfirm\fmapping\fsnippet\vexpand\1\0\0\0\fsources\1\0\0\1\0\1\tname\tpath\1\0\1\tname\nvsnip\1\0\1\tname\vbuffer\1\0\2\rpriority\3\n\tname\rnvim_lsp\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: vim-tmux-navigator
time([[Config for vim-tmux-navigator]], true)
try_loadstring("\27LJ\2\nÔ\2\0\0\a\0\16\0\0316\0\0\0009\0\1\0)\1\1\0=\1\2\0)\1\1\0=\1\3\0006\1\4\0'\3\5\0B\1\2\0029\1\6\1\18\2\1\0'\4\a\0'\5\b\0'\6\t\0B\2\4\1\18\2\1\0'\4\a\0'\5\n\0'\6\v\0B\2\4\1\18\2\1\0'\4\a\0'\5\f\0'\6\r\0B\2\4\1\18\2\1\0'\4\a\0'\5\14\0'\6\15\0B\2\4\1K\0\1\0\31<cmd>:TmuxNavigateDown<CR>\r<C-Down>\29<cmd>:TmuxNavigateUp<CR>\v<C-Up> <cmd>:TmuxNavigateRight<CR>\14<C-Right>\31<cmd>:TmuxNavigateLeft<CR>\r<C-Left>\6n\bmap\16..functions\frequire'tmux_navigator_disable_when_zoomed\31tmux_navigator_no_mappings\6g\bvim\0", "config", "vim-tmux-navigator")
time([[Config for vim-tmux-navigator]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nz\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\28current_line_blame_opts\1\0\0\1\0\1\18virt_text_pos\16right_align\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nù\t\0\0\b\0,\0b6\0\0\0'\2\1\0B\0\2\0029\1\2\0006\2\4\0009\2\5\2'\4\6\0009\5\2\0009\5\3\0055\6\a\0006\a\b\0=\a\b\6B\2\4\2=\2\3\0015\1\t\0006\2\4\0009\2\n\0029\2\v\0026\3\4\0009\3\n\0039\3\r\0036\5\4\0009\5\n\0059\5\v\0059\5\14\5\18\6\1\0B\3\3\2=\3\f\0026\2\0\0'\4\15\0B\2\2\0029\2\16\2\18\3\2\0'\5\17\0'\6\18\0'\a\19\0B\3\4\1\18\3\2\0'\5\17\0'\6\20\0'\a\21\0B\3\4\1\18\3\2\0'\5\17\0'\6\22\0'\a\23\0B\3\4\1\18\3\2\0'\5\17\0'\6\24\0'\a\25\0B\3\4\1\18\3\2\0'\5\17\0'\6\26\0'\a\27\0B\3\4\1\18\3\2\0'\5\17\0'\6\28\0'\a\29\0B\3\4\1\18\3\2\0'\5\17\0'\6\30\0'\a\31\0B\3\4\1\18\3\2\0'\5\17\0'\6 \0'\a!\0B\3\4\1\18\3\2\0'\5\17\0'\6\"\0'\a#\0B\3\4\1\18\3\2\0'\5\17\0'\6$\0'\a%\0B\3\4\1\18\3\2\0'\5\17\0'\6&\0'\a'\0B\3\4\1\18\3\2\0'\5\17\0'\6(\0'\a)\0B\3\4\1\18\3\2\0'\5\17\0'\6*\0'\a+\0B\3\4\1K\0\1\0*<cmd>lua vim.lsp.buf.formatting()<CR>\14<leader>o(<cmd>lua vim.lsp.codelens.run()<CR>\15<leader>cl@<cmd>lua vim.diagnostic.open_float(0, {scope = \"line\"})<CR>\15<leader>ld,<cmd>lua vim.diagnostic.goto_prev()<CR>\15<leader>pd,<cmd>lua vim.diagnostic.goto_next()<CR>\15<leader>nd-<cmd>lua vim.diagnostic.setloclist()<CR>\14<leader>d+<cmd>lua vim.lsp.buf.code_action()<CR>\15<leader>ca&<cmd>lua vim.lsp.buf.rename()<CR>\15<leader>rn*<cmd>lua vim.lsp.buf.references()<CR>\agr.<cmd>lua vim.lsp.buf.implementation()<CR>\agi.<cmd>lua vim.lsp.buf.signature_help()<CR>\15<leader>sh%<cmd>lua vim.lsp.buf.hover()<CR>\6K*<cmd>lua vim.lsp.buf.definition()<CR>\agD\6n\bmap\16..functions\nhover\twith\23textDocument/hover\rhandlers\blsp\1\0\1\vborder\vsingle\17capabilities\1\0\0\nforce\15tbl_extend\bvim\19default_config\tutil\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nı\2\0\0\5\0\20\0\0266\0\0\0'\2\1\0B\0\2\0025\1\3\0=\1\2\0006\0\0\0'\2\4\0B\0\2\0029\0\5\0005\2\t\0005\3\6\0005\4\a\0=\4\b\3=\3\n\0024\3\0\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\19ignore_install\1\2\0\0\tnorg\21ensure_installed\17query_linter\1\0\0\16lint_events\1\3\0\0\rBufWrite\15CursorHold\1\0\2\venable\2\21use_virtual_text\2\nsetup\28nvim-treesitter.configs\1\2\0\0\bzig\14compilers\28nvim-treesitter.install\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-lsp-ts-utils
time([[Config for nvim-lsp-ts-utils]], true)
try_loadstring("\27LJ\2\nè\5\0\2\v\0\18\0#6\2\0\0'\4\1\0B\2\2\0029\3\2\0025\5\3\0005\6\4\0=\6\5\0054\6\0\0=\6\6\0054\6\0\0=\6\a\5B\3\2\0019\3\b\2\18\5\0\0B\3\2\0015\3\t\0006\4\n\0009\4\v\0049\4\f\4\18\6\1\0'\a\r\0'\b\14\0'\t\15\0\18\n\3\0B\4\6\0016\4\n\0009\4\v\0049\4\f\4\18\6\1\0'\a\r\0'\b\16\0'\t\17\0\18\n\3\0B\4\6\1K\0\1\0\24:TSLspImportAll<CR>\agi\23:TSLspOrganize<CR>\ags\6n\24nvim_buf_set_keymap\bapi\bvim\1\0\1\vsilent\2\17setup_client#filter_out_diagnostics_by_code'filter_out_diagnostics_by_severity\26import_all_priorities\1\0\4\14same_file\3\1\fbuffers\3\4\19buffer_content\3\3\16local_files\3\2\1\0\n enable_import_on_completion\1\23import_all_timeout\3à'\21disable_commands\1!require_confirmation_on_move\1\27update_imports_on_move\1\26inlay_hints_highlight\fComment\21auto_inlay_hints\2\ndebug\1\29import_all_select_source\1\28import_all_scan_buffers\3d\nsetup\22nvim-lsp-ts-utils\frequireÑ\2\1\0\b\0\f\0\0266\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\4Ä6\2\3\0'\4\4\0B\2\2\0012\0\15Ä6\2\1\0'\4\2\0B\2\2\0029\2\5\0029\2\6\0025\4\t\0006\5\1\0'\a\a\0B\5\2\0029\5\b\5=\5\b\0043\5\n\0=\5\v\4B\2\2\1K\0\1\0K\0\1\0\14on_attach\0\1\0\0\17init_options\22nvim-lsp-ts-utils\nsetup\rtsserver?Typescript dependends on lsp. The functionality is disable\nprint\14lspconfig\frequire\npcall\0", "config", "nvim-lsp-ts-utils")
time([[Config for nvim-lsp-ts-utils]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
