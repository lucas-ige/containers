This image contains Ruff as well as Emacs and Vim, both of which are configured to auto-format Python code with Ruff on
save.

# Main software used in this image

 - The [Fedore](https://fedoraproject.org/) GNU/Linux container image
 - The [Ruff](https://docs.astral.sh/ruff/) Python linter and code formatter
 - The [GNU Emacs](https://www.gnu.org/software/emacs/) text editor
 - The [Vim](https://www.vim.org/) text editor
 - The [vim-plug](https://github.com/junegunn/vim-plug) pluggin manager for Vim
 - The [vim-lsp](https://github.com/prabirshrestha/vim-lsp) language server protocol for Vim

# Basic usage

To use Vim configured this way:

```sh
vim --cmd "source /config-files/vim_ruff-auto-format.vim"
```

To use Emacs configured this way:

```sh
emacs --load /config_files/emacs_ruff-auto-format.el
```
