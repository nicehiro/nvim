local config = require 'lspconfig'
local saga = require 'lspsaga'
local keymap = vim.api.nvim_set_keymap


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

config.pyright.setup{
	capabilities = capabilities
}

saga.init_lsp_saga()


-- original syntax
-- :nnoremap <silent> gd <Cmd>lua vim.lsp.buf.definition()<CR>

-- api
-- keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', {noremap=true, silent=true})

options = {noremap = true, silent = true}
-- async lsp finder
keymap('n', 'gh', [[<Cmd>lua require('lspsaga.provider').lsp_finder()<CR>]], options)
-- lsp hover doc
keymap('n', 'K', [[<Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]], options)
keymap('n', '<C-f>', [[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], options)
keymap('n', '<C-b>', [[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], options)
-- signature help
keymap('n', 'gs', [[<Cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>]], options)
-- preview definition
keymap('n', 'gd', [[<Cmd>lua require('lspsaga.provider').preview_definition()<CR>]], options)
-- float terminal
keymap('n', '<A-d>', [[<Cmd>lua require('lspsaga.floaterm'.open_float_terminal()<CR>]], options)
