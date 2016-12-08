runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax on
filetype plugin indent on

set tabstop=2 shiftwidth=2 expandtab
set number
set nowrap

if has("gui_running")
  set background=dark
  colorscheme solarized

  if has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ 10
    set guioptions-=m " remove menu bar
    set guioptions-=T " remove toolbar
    set guioptions-=r " remove right-hand scroll bar
    set guioptions-=L " remove left-hand scroll bar
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  endif
endif

" Tex specific settings
set grepprg=grep\ -nH\ $*
autocmd BufEnter *.tex map <leader>lq :w<CR>:Make! quick<CR>
autocmd BufEnter *.tex map <leader>la :w<CR>:Make! all<CR>
autocmd BufRead,BufNewFile *.tex setlocal spell

" Trailing whitespace
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
noremap <leader>w :call DeleteTrailingWS()<CR>
autocmd BufWrite *.tex :call DeleteTrailingWS()

" Swap files
set noswapfile
