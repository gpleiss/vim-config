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
autocmd BufRead,BufNewFile *.tex setlocal spell
let g:Tex_MultipleCompileFormats='pdf,bib,pdf'
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_TreatMacViewerAsUNIX = 0
let g:Tex_UseMakefile = 1
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*'
if has("gui_running")
  autocmd BufEnter *.tex map <leader>la :w<CR><leader>ll<CR>
  if has("gui_gtk2")
    let g:Tex_ViewRule_pdf='zathura'
  elseif has("gui_macvim")
    let g:Tex_ViewRule_pdf = 'Skim'
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
