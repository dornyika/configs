set number " show line number
set relativenumber " show relative line number
set clipboard=unnamedplus "	makes system clipboard available
set mouse=a "	enables mouse support
set ignorecase
set smartcase
set cursorline " highlights current line
set nowrap " does not wrap line at the end of the window 
set completeopt=menuone,noinsert,noselect
set termguicolors " this variable must be enabled for colors to be applied properly
set nobackup
set noswapfile
set laststatus=3 " displays one global status line
let mapleader = " " "	sets <space> as map leader
set cmdheight=1
set spelllang=en_us,hu
"set signcolumn=yes
set splitbelow splitright 
set incsearch
set inccommand=nosplit
set expandtab
set softtabstop=3
set shiftwidth=3
set tabstop=3
set numberwidth=4 "set line number column width
set scrolloff=4 "start scrolling when 6 lines from top or bottom
set showbreak=↪
set linebreak

" netrw settings
let g:netrw_banner = 0 " Hide banner
let g:netrw_liststyle = 3 " Tree-style view
let g:netrw_browse_split = 4 " Open in previous window
let g:netrw_altv = 1 " Open with right splitting
let g:netrw_winsize = 30 

"key mappings
:nnoremap <leader>sp :set spell!<CR>
:nnoremap <leader>wr :set wrap linebreak nolist!<CR>

:nnoremap , :
:vnoremap , :

:noremap <leader>w :up<CR>

"change windows with arrow keys
:nmap <up> <C-w><up>
:nmap <down> <C-w><down>
:nmap <right> <C-w><right>
:nmap <left> <C-w><left>

"copy yanked text, not deleted text
:nmap ,p "0p
:nmap ,P "0P

" moving lines
:inoremap <A-j> <Esc>:m .+1<CR>==gi
:inoremap <A-k> <Esc>:m .-2<CR>==gi
:nnoremap <A-k> :m .-2<CR>==
:nnoremap <A-j> :m .+1<CR>==
:vnoremap <A-j> :m '>+1<CR>gv=gv
:vnoremap <A-k> :m '<-2<CR>gv=gv


call plug#begin()
Plug 'nvim-lualine/lualine.nvim'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter.git', {'do': ':TSUpdate'}
Plug 'https://github.com/RRethy/nvim-base16.git'
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'https://github.com/rebelot/kanagawa.nvim.git'
Plug 'https://github.com/rose-pine/neovim.git'
Plug 'jdhao/better-escape.vim' " better/faster escape with 'jk' keybindings than with mapping 
Plug 'junegunn/goyo.vim' " distraction free writing environment, starting :Goyo
Plug 'norcalli/nvim-colorizer.lua'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'https://github.com/junegunn/limelight.vim.git' "fades out not current paragraphs, starting: :Limelight, turn off :Limelight!, toggle: :Linelight!!
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'https://github.com/nvim-neo-tree/neo-tree.nvim.git'
Plug 'MunifTanjim/nui.nvim'
Plug 'folke/which-key.nvim' "shows keyboard shortcuts, mappings in popup window
Plug 'https://github.com/nathanaelkane/vim-indent-guides.git' "visually display ident levels in code, starting: <leader>
Plug 'psliwka/vim-smoothie' "smooth scrolling
Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()


colorscheme kanagawa

" highlights selected (yanked) text
au TextYankPost * silent! lua vim.highlight.on_yank() 

" start limelight when you enter goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

lua << EOF
  require("which-key").setup {
  }
EOF

lua << EOF
 require'nvim-web-devicons'.setup {
 default = true,}
EOF

lua << END
require('lualine').setup()
END

lua require'colorizer'.setup()

lua << EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = "all",
	highlight = {
		enable = true,},
	indent = {
		enable = true}
	}
EOF

