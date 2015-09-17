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
    set guifont=Inconsolata\ 12
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
set iskeyword+=:
autocmd BufRead,BufNewFile *.tex setlocal spell
let g:Tex_MultipleCompileFormats='pdf,bib,pdf'
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
if has("gui_running")
  if has("gui_gtk2")
    let g:Tex_ViewRule_pdf='zathura'
    autocmd BufEnter *.tex map <leader>la :w<CR><leader>ll<CR>
  elseif has("gui_macvim")
    let g:Tex_ViewRule_pdf='open -a Preview'
    autocmd BufEnter *.tex map <leader>la :w<CR><leader>ll<CR><leader>lv<CR>
  endif
endif

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
