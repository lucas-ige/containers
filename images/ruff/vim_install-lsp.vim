" Copyright (c) 2025-now Institut des Géosciences de l'Environnement, France.
"
" License: BSD 3-clause "new" or "revised" license (BSD-3-Clause).
"
" Vim script to install the LSP plugin.

source /third-party-software/vim-plug/plug.vim

call plug#begin()
Plug 'prabirshrestha/vim-lsp', { 'dir': '/third-party-software/vim-plugged/vim-lsp' }
call plug#end()

PlugInstall
