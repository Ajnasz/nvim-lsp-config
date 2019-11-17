if exists('g:nvim_lsp_config_loaded')
	finish
endif
let g:nvim_lsp_config_loaded = 1

call nvim_lsp_config#setup()
