call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

Plug 'majutsushi/tagbar'

" Auto pairs
Plug 'jiangmiao/auto-pairs'
"Plug 'vim-scripts/delimitMate.vim'

Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }


" Plugin for latex
Plug 'lervag/vimtex'

" Highlight yank area
Plug 'machakann/vim-highlightedyank'

" Snipet plugins
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Distraction-free mode
Plug 'junegunn/goyo.vim'

" Dim other line except the current one.
Plug 'junegunn/limelight.vim'

" Markdown set of plugins
" tabular plugin is used to format tables
Plug 'godlygeek/tabular'
" JSON front matter highlight plugin
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
" Markown preview
" if you don't have node and yarn, use pre build
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'ellisonleao/glow.nvim'

" Syntax highlight
Plug 'vim-pandoc/vim-pandoc-syntax'

" Code folding.
"Plug 'tmhedberg/SimpylFold'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Add icon
" Plug 'ryanoasis/vim-devicons'

Plug 'github/copilot.vim'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:python3_host_prog = '/usr/bin/python3'

" Setup copy for neovim and tmux.
set clipboard+=unnamedplus


set number
" General neovim setup.
" vim-numbertoggle - Automatic toggling between 'hybrid' and absolute line numbers
" Maintainer:        <https://jeffkreeftmeijer.com>
" Version:           2.1.2
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

let g:deoplete#enable_at_startup = 1

nnoremap <silent> <C-K><C-T> :TagbarToggle<CR>

" NERDTree
nnoremap <C-K><C-N> :NERDTreeToggle<CR>

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

let g:neomake_python_enabled_makers = ['pylint']

" Auto open NERDTree.
" autocmd VimEnter * NERDTree | wincmd p

" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable
let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexrun'



" deoplete: automatically close the method preview window.
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" UltiSnip Plugin
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> to trigger autocompletion
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Goyo plugin
let g:goyo_width=250

" Vim-markdown plugin
" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" do not close the preview tab when switching to other buffers
" let g:mkdp_auto_close = 0
" nnoremap <M-m> :MarkdownPreview<CR>
nmap <C-s> <Esc>:MarkdownPreview<CR>

" vim-pandoc
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" Treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup.




call plug#end()

colorscheme catppuccin-mocha

" Vimtex with deoplete
" This is new style
call deoplete#custom#var('omni', 'input_patterns', {'tex': g:vimtex#re#deoplete})




lua << EOF
require('glow').setup()
EOF
