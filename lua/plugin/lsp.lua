local nvim_lsp = require('lspconfig')
local saga = require 'lspsaga'
local dap = require 'dap-python'
local keymap = vim.api.nvim_set_keymap

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

saga.init_lsp_saga()


-- original syntax
-- :nnoremap <silent> gd <Cmd>lua vim.lsp.buf.definition()<CR>

-- api
-- keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', {noremap=true, silent=true})

options = {noremap = true, silent = true}
-- async lsp finder
keymap('n', 'gh', [[<Cmd>lua require('lspsaga.provider').lsp_finder()<CR>]], options)
-- -- lsp hover doc
-- keymap('n', 'K', [[<Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]], options)
-- keymap('n', '<C-f>', [[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], options)
-- keymap('n', '<C-b>', [[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], options)
-- -- signature help
-- keymap('n', 'gs', [[<Cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>]], options)
-- -- preview definition
keymap('n', 'gd', [[<Cmd>lua require('lspsaga.provider').preview_definition()<CR>]], options)
-- rename
keymap('n', 'gr', [[<Cmd]lua require('lspsaga.rename').rename()<CR>]], options)
-- -- float terminal
-- keymap('n', 'gt', [[<Cmd>lua require('lspsaga.floaterm'.open_float_terminal()<CR>]], options)
-- keymap('n', 'gt', [[<Cmd>lua require('lspsaga.floaterm'.open_float_terminal()<CR>]], options)


-- dap python config
dap.setup('/home/hiro/.dap/bin/python')
keymap('n', '<f5>', [[<Cmd>lua require('dap').toggle_breakpoint()<CR>]], options)
keymap('n', '<f6>', [[<Cmd>lua require('dap').continue()<CR>]], options)
keymap('n', '<f7>', [[<Cmd>lua require('dap').step_over()<CR>]], options)
keymap('n', '<f8>', [[<Cmd>lua require('dap').step_into()<CR>]], options)
keymap('n', '<f9>', [[<Cmd>lua require('dap').repl.open()<CR>]], options)
