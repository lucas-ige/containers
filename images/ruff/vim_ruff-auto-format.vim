" Copyright (c) 2025-now Institut des Géosciences de l'Environnement, France.
"
" License: BSD 3-clause "new" or "revised" license (BSD-3-Clause).
"
" Vim configuration to auto-format Python code with Ruff on save.

source /third-party-software/vim-plug/plug.vim

call plug#begin()
Plug 'prabirshrestha/vim-lsp', { 'dir': '/third-party-software/vim-plugged/vim-lsp' }
call plug#end()

" Ruff server configuration (from https://docs.astral.sh/ruff/editors/setup/)
if executable('ruff')
    au User lsp_setup call lsp#register_server({'name': 'ruff', 'cmd': {server_info->['ruff', 'server']}, 'allowlist': ['python'], 'workspace_config': {}})
endif

" Auto format with Ruff on save
autocmd BufWritePre *.py LspDocumentFormatSync
