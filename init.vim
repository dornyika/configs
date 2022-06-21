set number " show line number
set relativenumber " show relative line number
set clipboard=unnamedplus "	makes system clipboard available
set mouse=a "	enables mouse support
set ignorecase
set smartcase
set cursorline " highlights current line
set nowrap " does not wrap line at the end of the window 
set completeopt=menuone,noselect,noinsert
set omnifunc=syntaxcomplete#Complete
set shortmess+=c " do not show autocomplete messages
set termguicolors " this variable must be enabled for colors to be applied properly
set nobackup
set noswapfile
set laststatus=3 " displays one global status line
let mapleader = "," "	sets <space> as map leader
set spelllang=en_us,hu
set splitbelow splitright
set incsearch
set inccommand=nosplit
set expandtab
set softtabstop=3
set shiftwidth=3
set tabstop=3
set numberwidth=5 "set line number column width
set scrolloff=4 "start scrolling when 6 lines from top or bottom
set showbreak=↪
set linebreak
set switchbuf=usetab,newtab
"set signcolumn=yes
"set noshowmode "do not show what mode you're in (for example if you got in the status line)
"set background=light

" netrw settings
let g:netrw_banner = 1 " Set 0 for hide banner
let g:netrw_liststyle = 3 " Tree-style view
let g:netrw_browse_split = 4 " Open in previous window
let g:netrw_altv = 1 " Open with right splitting
let g:netrw_winsize = 30

"key mappings
:nnoremap <leader>sp :set spell!<CR>
:nnoremap <leader>wr :set wrap linebreak nolist!<CR>

" a kettőspont helyett legyen vessző
":nnoremap , :
":vnoremap , :

":noremap <leader>w :up<CR>

"change windows with arrow keys
:nmap <up> <C-w><up>
:nmap <down> <C-w><down>
:nmap <right> <C-w><right>
:nmap <left> <C-w><left>

"copy yanked text, not deleted text
:nmap ,p "0p
:nmap ,P "0P

" regular copy&paste with crtl-c, crtl-v
vnoremap <C-c> "+y
map <C-p> "+P

" moving lines up and down
:inoremap <A-j> <Esc>:m .+1<CR>==gi
:inoremap <A-k> <Esc>:m .-2<CR>==gi
:nnoremap <A-k> :m .-2<CR>==
:nnoremap <A-j> :m .+1<CR>==
:vnoremap <A-j> :m '>+1<CR>gv=gv
:vnoremap <A-k> :m '<-2<CR>gv=gv

call plug#begin()
Plug 'nvim-lualine/lualine.nvim' " status line
Plug 'https://github.com/nvim-treesitter/nvim-treesitter.git', {'do': ':TSUpdate'} " syntax highlight
Plug 'https://github.com/RRethy/nvim-base16.git' " color scheme
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/rebelot/kanagawa.nvim.git' "color scheme
Plug 'mcchrish/zenbones.nvim' "color scheme
Plug 'rktjmp/lush.nvim' " required by zenbones
Plug 'jdhao/better-escape.vim' " better/faster escape with 'jk' keybindings than with mapping 
"Plug 'https://github.com/junegunn/goyo.vim' " distraction free writing environment, starting :Goyo
"Plug 'https://github.com/junegunn/limelight.vim.git' "fades out not current paragraphs, starting: :Limelight, turn off :Limelight!, toggle: :Linelight!!
Plug 'folke/zen-mode.nvim'
Plug 'folke/twilight.nvim'
Plug 'norcalli/nvim-colorizer.lua' " adds background colors to color codes
Plug 'ryanoasis/vim-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim' " required for telescope, gitsign (lua stuff)
Plug 'nvim-telescope/telescope.nvim' " search
Plug 'https://github.com/nvim-neo-tree/neo-tree.nvim.git'
Plug 'MunifTanjim/nui.nvim'
Plug 'folke/which-key.nvim' " shows keyboard shortcuts, mappings in popup window
Plug 'lukas-reineke/indent-blankline.nvim' " adds indentation guides to all lines (including empty lines)
Plug 'lukas-reineke/headlines.nvim' " adds 3 kind of horizontal highlights for text filetypes, like `markdown`, `vimwiki` and `orgmode`
Plug 'windwp/nvim-autopairs'
Plug 'wfxr/minimap.vim'
Plug 'psliwka/vim-smoothie' " smooth scrolling
Plug 'lifepillar/vim-mucomplete' " combines different autocomplete modes (path, omni, buffer, dictionary, spell)
Plug 'othree/html5.vim'
Plug 'https://github.com/junegunn/vim-journal.git'
Plug 'junegunn/seoul256.vim'
Plug 'nvim-neorg/neorg'
call plug#end()

colorscheme gruvbox

" highlights selected (yanked) text
au TextYankPost * silent! lua vim.highlight.on_yank() 

" start limelight when you enter goyo
"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight!

let g:mucomplete#enable_auto_at_startup = 1

lua << EOF
  require("zen-mode").setup {
  }
EOF

lua << EOF
  require("twilight").setup {
  }
EOF


lua require'colorizer'.setup()

lua << EOF
require("headlines").setup()
EOF

lua << EOF
require("nvim-autopairs").setup {}
EOF

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

lua << EOF
require('gitsigns').setup()
EOF

lua << EOF
require'nvim-treesitter.configs'.setup {
   ensure_installed = "all",
	highlight = {
		enable = true,},
	indent = {
		enable = true}
	}
EOF

lua << EOF
require('neorg').setup {
   load = {
      ["core.defaults"] = {},
      ["core.norg.concealer"] = {
         config = {}
         },
      ["core.export.markdown"] = {
         config = {}
         },
      ["core.norg.qol.toc"] = {
         config = {}
         },
      ["core.norg.manoeuvre"] = {
         config = {}
         },
      ["core.norg.journal"] = {
         config = {}
         },
      ["core.norg.dirman"] = {
         config = {}
         },
      ["core.export"] = {
         config = {}
         },
      }
   }
EOF
