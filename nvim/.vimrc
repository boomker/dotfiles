
" -----------------------------------------------------------------------------
"  < 判断操作系统是否是 Windows 还是 Unix >
" -----------------------------------------------------------------------------
let g:isWin = 0
let g:isUnix = 0
if(has("win32") || has("win64"))
    let g:isWin = 1
else
    let g:isUnix = 1
endif

" -----------------------------------------------------------------------------
"  < 判断是终端还是 Gvim >
" -----------------------------------------------------------------------------
if has("gui_running")
    let g:isGUI = 1
    highlight Comment gui=italic
else
    let g:isGUI = 0
    " set t_Co=256                   " 在终端启用256色
    " highlight Comment cterm=italic
endif

if (g:isWin && g:isGUI)
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    " behave mswin
    language messages zh_CN.utf-8                           "解决状态信息栏乱码问题
    set iminsert=2                                          "输入法设置"
    set mousef                                              "启用光标激活pane
    set mouse=a                                           " 在任何模式下启用鼠标,但是右键用不了
    set imi=2                                       " 搜狗输入法在macvim混乱的解决方法如下:
    set ims=2
    set guiheadroom=0                               " 禁止GTK填充窗口底部为主题背景色，此设置会消除底部的水平滚动条"
    " set guifont=Source_Code_Pro:h15:cANSI
    au GUIEnter * simalt ~x                                 "窗口启动时自动最大化
    autocmd bufwritepost _vimrc source $VIM/_vimrc
endif


if has('nvim')
    " set inccommand=split
    set runtimepath+='~/.nvim/runtime'
    let &packpath = &runtimepath
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    " let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    " let $XDG_CONFIG_HOME="~/.nvim"
    let g:python3_host_prog = '/usr/local/bin/python3'
    " let g:python3_host_prog = '/usr/bin/python3'
    let g:node_host_prog = '/usr/local/bin/neovim-node-host'
    set termguicolors
endif

" for common UI Settings:
    " colorscheme gruvbox
    colorscheme onedark
    let g:onedark_terminal_italics=1
    let g:onedark_hide_endofbuffer=1
    set background=dark

" 设置标记一列的背景颜色和数字一行颜色一致
    hi! link SignColumn   LineNr
    hi! link ShowMarksHLl DiffAdd
    hi! link ShowMarksHLu DiffChange

" for error highlight，防止错误整行标红导致看不清
    highlight clear SpellBad
    highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
    highlight clear SpellCap
    highlight SpellCap term=underline cterm=underline
    highlight clear SpellRare
    highlight SpellRare term=underline cterm=underline
    highlight clear SpellLocal
    highlight SpellLocal term=underline cterm=underline


set nocompatible                                      "禁用 Vi 兼容模式
set shortmess=atI                                     "去掉欢迎界面
set guioptions-=m                                     "去掉菜单栏"
set guioptions-=e                                     "去掉标签栏"
set guioptions-=T                                     "去掉工具栏"
set guioptions-=r                                     "去掉右边的滚动条"
set guioptions-=L
set laststatus=2                                      "启用状态栏信息
set cmdheight=2
set showtabline=2                                     "当只有一个标签时也显示标签行
set noshowmode                                        " 不再显示模式状态
set noshowcmd
set lazyredraw
set helplang=cn
set number                                            "显示行号
set wrap                                              "设置自动折行
set formatoptions+=j
" set nolinebreak                                       "不自动换行
set magic                                             "打开正则匹配模式
set noimd                                             "关闭输入法
set nobomb                                            " 禁止UTF-8 BOM
set ma
set termencoding=utf-8
set encoding=utf-8                                      "设置gvim内部编码
set fileencoding=utf-8                                  "设置此缓冲区所在文件的字符编码
set fileencodings=utf-8,cp936,ucs-bom,gb18030,gb2312    "设置支持打开的文件的编码
set fileformat=unix
set fileformats=unix,dos                                "给出文件的<EOL>格式类型
set backspace=indent,eol,start
set viewoptions=folds,options,cursor,unix,slash         "better unix/Windows compatible
set virtualedit=onemore                                 "curso可以移动到行尾最后一个字符之后"
set autochdir
set autoindent
set smartindent                                         "启用智能对齐方式
set shiftround
set smarttab                                            "指定行首按一次backspace就删除shiftwidth宽度的空格
set expandtab                                           "将Tab键转换为空格
set tabstop=4                                           "设置Tab键的宽度
set softtabstop=4
set shiftwidth=4                                        "换行时自动缩进4个空格
set scrolloff=3                                         "上下滚动时当前行距顶或低保持有3行"
set cursorline
" set cursorline cursorcolumn                           "突出显示当前行
set colorcolumn=120
set selection=inclusive
set selectmode=mouse,key
set ttyfast

set foldenable                                          "启用折叠
" set foldmethod=marker
set foldmethod=indent                                   "indent 折叠方式
" set foldopen=all                                        "光标移到折叠时自动打开
" set foldclose=all
set autoread                                            "当文件在外部被修改，自动更新该文件
set clipboard+=unnamedplus
set hlsearch                                "高亮搜索
set incsearch                               "在输入要搜索的文字时，实时匹配
set ignorecase                              "搜索模式里忽略大小写
set smartcase                               "搜索模式包含大写字符，忽略上一行设置
set matchtime=3                             "匹配括号光标停留时间"
set updatetime=300
set showmatch
set matchpairs+=<:>                         " specially for html"
set history=500                             "保存更多的history"
set wildmenu
set vb t_vb=                                "关闭提示音
set nobackup                                "设置无备份文件
set noswapfile                              "设置无临时文件
set nowritebackup                           "无写入备份
syntax on
filetype plugin on

" ===============< Hotkey mapping >======================
let mapleader = ";"
inoremap <ESC> <ESC>:nohl<CR>
nnoremap <leader><space> :nohl<CR>
nmap <Up> <Nop>
nmap <Down> <Nop>
nmap <Left> <Nop>
nmap <Right> <Nop>

nmap J gJ
vmap j gj
vmap k gk
nmap H ^
nmap L $
nmap d<CR> dG
nmap dj 2dd
nmap dk k2dd
nmap Y y$
nmap y<CR> yG
nmap yj 2yy
nmap yk k2yy
nmap yp yyp
noremap gl gu
noremap gu gU
noremap '' ``zz
noremap mm `.
noremap <silent> <expr> j (v:count == 0 ? 'gjzz' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gkzz' : 'k')
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'
nmap gp <Plug>(GitGutterPrevHunk)
nmap gn <Plug>(GitGutterNextHunk)

" like o or O, but not change cursor position and mode
nmap tt :tabnew!<CR>

nnoremap <CR> :

nnoremap zl <C-w>v
nnoremap zh <C-w>s

" space key to toggle whether fold
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zO')<CR>

vnoremap < <gv
vnoremap > >gv
vnoremap v <Esc>

" saving file as sudo when forgot to start vim using sudo
nmap <Leader>sw :w !sudo tee > /dev/null %<CR>
command! W w !sudo tee % > /dev/null

" quickly way to move between buffers or tabs
    nmap <Leader>wj <C-W>j
    nmap <Leader>wk <C-W>k
    nmap <Leader>wh <C-W>h
    nmap <Leader>wl <C-W>l

    noremap <leader>1 1gt
    noremap <leader>2 2gt
    noremap <leader>3 3gt
    noremap <leader>4 4gt
    noremap <leader>5 5gt
    noremap <leader>6 6gt
    noremap <leader>7 7gt
    noremap <leader>8 8gt
    noremap <leader>9 9gt
    noremap <leader>0 :tablast<cr>
    noremap <leader>bf :tabfirst<cr>
    noremap <leader>bl :tablast<cr>
    noremap <leader>bb :tabprev<cr>
    noremap <leader>bn :tabnext<cr>
    noremap <leader>bm :tabmove

" ------------------------------------< Complex configure >------------------------------------
"
if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" autocmd! bufwritepost .vimrc :source ~/.vimrc
nmap <leader>rc :source ~/.vimrc<CR>

"  in the normal mode autoset relative_number
augroup relative_numbser
    autocmd!
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
augroup END

" highlight keyword
if has("autocmd")
    " Highlight TODO, FIXME, NOTE, etc.
      if v:version > 701
          autocmd Syntax * call matchadd('Todo', '\W\zs\(TODO\|IDEA\|NOTE\|NOTICE\|重要\|要点\|注意\|现象\|原因\|解决\)')
          autocmd Syntax * call matchadd('ErrorMsg', '\W\zs\(HACK\|XXX\|错误\|故障\)')
      endif
endif


" 设置在 tmux & xterm 里粘贴系统剪贴板里的字符时保持原有排版格式
function! WrapForTmux(s)
    if !exists('$TMUX')
        return a:s
    endif

    let tmux_start ="\<Esc>Ptmux;"
    let tmux_end ="\<Esc>\\"

    return tmux_start . substitute(a:s,"\<Esc>","\<Esc>\<Esc>",'g'). tmux_end
endfunction
let&t_SI .=WrapForTmux("\<Esc>[?2004h")
let&t_EI .=WrapForTmux("\<Esc>[?2004l")

" 在tmux 里使用 tmux 的方式复制文本的话(跨窗口共享 tmux buffer), 粘贴时直接使用<C-V>/<⌘ -V>
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return""
endfunction

" 设置 Python/shell 文件格式的文件头部信息
autocmd BufNewFile *.py,*.sh :call SetFileHeadInfo()
let $author_name = "Shingo"
let $author_email = "gmboomker@gmail.com"
func! SetFileHeadInfo()
    if expand("%:e") == 'py'
        " call setline(1, '#!/usr/bin/env python3')
        call setline(1, '# !/usr/local/bin/env python3')
    elseif expand("%:e") == 'sh'
        call setline(1, '#!/usr/bin/env bash')
        " call setline(1, '# !/usr/local/bin/env bash')
    endif
    call append(2, '# *************************************************')
    call append(3, '#')
    call append(4, '#       Filename: '.expand("%"))
    call append(5, '#         Author: '.$author_name)
    call append(6, '#          Email: '.$author_email)
    call append(7, '#         Create: '.strftime("%Y-%m-%d %H:%M:%S"))
    call append(8, '#       Description: -')
    call append(9, '#')
    call append(10, '# *************************************************')
    normal Go
endfunc
nnoremap <Leader>sh <ESC>ggO<ESC>:call SetFileHeadInfo()<CR>

" Delete trailing whitespace
autocmd FileType python,go,php,javascript,yml,txt,sh autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()
fun! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" open terminal in specified eatra split window
" press <C-d> to exit terminal
if has('nvim')
    func! OpenTerminal()
        " open split windows on the topleft
        topleft split
        " resize the height of terminal windows to 30
        resize 15
        :terminal
    endf
else
    func! OpenTerminal()
        topleft split
        resize 15
        :call term_start('zsh', {'curwin' : 1, 'term_finish' : 'close'})
    endf
endif
nnoremap <Leader>ot :call OpenTerminal()<cr>
" nnoremap <Leader>zt :ZoomWinTabToggle<cr>

" Copy_search_matches func
function! CopyMatches(reg)
    let hits = []
    %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
    let reg = empty(a:reg) ? '+' : a:reg
    execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)


" ==============< Plugins configure >================

" lightline configure:
    function! LightlineReadonly()
        return &readonly ? '' : ''
    endfunction
    let g:lightline = {
      \ 'component_function': {
      \   'readonly': 'LightlineReadonly'
      \ },
      \ 'separator': { 'left': '', 'right': '' }
      \ }

" vim easymotion configure:
    let g:EasyMotion_smartcase = 1
    let g:EasyMotion_leader_key = 'f'
    let g:EasyMotion_startofline = '0'
    " let g:EasyMotion_do_mapping = 0
    let g:EasyMotion_prompt = 'Jump to {n}→ '
    " let g:EasyMotion_keys = 'fjdkswbeoavn'
    let g:EasyMotion_use_smartsign_us = 1
    nmap f/ <Plug>(easymotion-fn)
    " support multi keyword used expr to find
    nmap f? <Plug>(easymotion-Fn)
    nmap ff <Plug>(easymotion-w)
    nmap fh <Plug>(easymotion-lineanywhere)
    nmap fl <Plug>(easymotion-lineforward)
    nmap fo <Plug>(easymotion-overwin-f)
    nmap fi <Plug>(easymotion-overwin-line)
    nmap f. <Plug>(easymotion-repeat)

" incsearch configure:
    nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
    map *   <Plug>(asterisk-*)
    map #   <Plug>(asterisk-#)
    map g*  <Plug>(asterisk-g*)
    map g#  <Plug>(asterisk-g#)

    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    " map *  <Plug>(incsearch-nohl-*)
    " map #  <Plug>(incsearch-nohl-#)

" easy_align configure:
    vmap <Enter> <Plug>(EasyAlign)
    nmap <Leader>ga <Plug>(EasyAlign)
    xmap <Leader>ga <Plug>(EasyAlign)

" multiplecursors configure:
    let g:VM_maps = {}
    let g:VM_leader = ','
    " let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
    " let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n
    let g:VM_maps["Undo"] = 'u'
    let g:VM_maps["Redo"] = '<C-r>'

" fzf configure:

    nmap <leader>f [fzf-p]
    nnoremap <silent> [fzf-p]o     :<C-u>FzfPreviewDirectoryFiles<CR>
    nnoremap <silent> [fzf-p]h     :<C-u>FzfPreviewMruFiles<CR>
    nnoremap <silent> [fzf-p]f     :<C-u>FzfPreviewProjectFiles<CR>
    nnoremap <silent> [fzf-p]b     :<C-u>FzfPreviewBuffers<CR>
    nnoremap <silent> [fzf-p]t     :<C-u>FzfPreviewBufferTags<CR>
    nnoremap <silent> [fzf-p]l     :<C-u>FzfPreviewBufferLines<CR>

    let $FD_DEFAULT_OPTS = '--follow --exclude **/.pyc --exclude .git --exclude .idea --exclude node_modules --exclude venv'

    " 打开 fzf 的方式选择 floating window
    let g:fzf_preview_quit_map = 1

    " Use floating window (for neovim)
    let g:fzf_preview_use_floating_window = 1

    " floating window size ratio
    let g:fzf_preview_floating_window_rate = 0.9

    " floating window winblend value
    let g:fzf_preview_floating_window_winblend = 15
    let g:fzf_preview_directory_files_command = 'fd --type f --type l "${FD_DEFAULT_OPTS}"'

    " Commands used to get the file list from git repository
    let g:fzf_preview_git_files_command = 'git ls-files --exclude-standard'

    " Commands used to get the file list from current directory
    let g:fzf_preview_directory_files_command = 'rg --files --hidden --follow --no-messages -g \!"* *"'

    " Commands used for project grep
    let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading --color=never'

" nerdcommenter configure:
    let g:NERDSpaceDelims=1
    let g:NERDCompactSexyComs = 1
    let g:NERDAltDelims_python = 1
    let g:NERDDefaultAlign = 'left'

" defx configure:
    map <silent> <Leader>st :Defx `expand('%:p:h')` -search=`expand('%:p')`<CR>
    autocmd VimEnter * call defx#custom#option('_', {
        \ 'auto_cd': 1,
        \ 'columns': 'indent:git:icons:mark:filename:type',
        \ 'winwidth': 40,
        \ 'split': 'vertical',
        \ 'direction': 'topleft',
        \ 'show_ignored_files': 0,
        \ 'ignored_files': '.git*,.*dump*',
        \ })

    " Define mappings
    autocmd FileType defx call s:defx_my_settings()
    function! s:defx_my_settings() abort
        setl nospell
        setl signcolumn=no
        setl nonumber
        nnoremap <silent><buffer><expr> <CR>
            \ defx#is_directory() ?
            \ defx#do_action('open') :
            \ defx#do_action('multi', ['drop', 'quit'])
        nmap <silent><buffer><expr> <2-LeftMouse>
            \ defx#is_directory() ?
            \ defx#do_action('open_or_close_tree') :
            \ defx#do_action('drop',)
        nnoremap <silent><buffer><expr> o
            \ defx#is_directory() ?
            \ defx#do_action('open_or_close_tree') :
            \ defx#do_action('drop',)
        nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
        nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
        nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabe')
        nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
        nnoremap <silent><buffer><expr> c defx#do_action('copy')
        nnoremap <silent><buffer><expr> p defx#do_action('paste')
        nnoremap <silent><buffer><expr> r defx#do_action('rename')
        nnoremap <silent><buffer><expr> x defx#do_action('remove_trash')
        nnoremap <silent><buffer><expr> N defx#do_action('new_multiple_files')
        nnoremap <silent><buffer><expr> u defx#do_action('cd', ['..'])
        nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
        nnoremap <silent><buffer><expr> R defx#do_action('redraw')
        nnoremap <silent><buffer><expr> q defx#do_action('quit')
        nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
    endfunction

    " Defx git and Defx icons
    let g:defx_git#column_length = 0

    let g:defx_icons_enable_syntax_highlight = 1
    " let g:defx#_python_version_check

" gitgutter configure configure:
    set updatetime=50
    let g:gitgutter_max_signs = 1000
    let g:gitgutter_sign_added = '✚'
    let g:gitgutter_sign_modified = '✎'
    let g:gitgutter_sign_removed = '✖'
    let g:gitgutter_sign_removed_first_line = '➤'
    let g:gitgutter_sign_modified_removed = '✹'
    let g:easygit_enable_command = 1

" MundoToggle configure:
    set undofile
    set undodir=~/.vim/undo
    nnoremap <Leader>ut :MundoToggle<CR>

" ale configure:
    let g:ale_fix_on_save = 1
    let g:ale_completion_enabled = 1
    let g:ale_sign_column_always = 1
    " let g:ale_set_highlights = 1
    let g:ale_set_highlights = 0
    let g:ale_sign_error = '◉'
    let g:ale_sign_warning = '◉'
    highlight! ALEErrorSign ctermfg=9 guifg=#C30500
    highlight! ALEWarningSign ctermfg=11 guifg=#F0C674
    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    let g:ale_open_list = 0
    let g:ale_lint_delay = 500
    let g:ale_python_flake8_options="--ignore=E114,E116,E131,E221,E501,E701 --max-line-length=120"
    let g:ale_linters = {'python': 'flake8'}
    " https://blog.csdn.net/zgljl2012/article/details/51907663
    let g:ale_emit_conflict_warnings = 0
    nmap sn <Plug>(ale_next_wrap)
    nmap sp <Plug>(ale_previous_wrap)


" deoplete configure:
    " let g:deoplete#enable_at_startup = 1
    inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" Snippets or ultisnips configure:
    " Trigger configuration. Do not use <tab> if you use deoplete and YCM
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger  = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    " let g:UltiSnipsJumpForwardTrigger="<c-b>"
    " let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    " let g:UltiSnipsEditSplit="vertical"

" CompleteParameter configure:
    inoremap <silent> <expr> ) complete_parameter#pre_complete("()")
    smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
    imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
    smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
    imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)

" Autopep8 configure:
    autocmd FileType python noremap <buffer> <Leader>ap :w!<CR>:call Autopep8()<CR>
    let g:autopep8_ignore="W391"
    " let g:autopep8_select="E501,W293"

" autoformat configure for F10 run Pycode:
    let g:autoformat_autoindent = 0
    let g:autoformat_retab = 0
    let g:autoformat_remove_trailing_spaces = 0
    map <Leader>rp <ESC>:Autoformat<CR>:w<CR>:call RunPython()<CR>
    function! RunPython()
        let mp = &makeprg
        let ef = &errorformat
        let exeFile = expand("%:t")
        setlocal makeprg=python3\ -u
        set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
        silent make %
        copen
        let &makeprg = mp
        let &errorformat = ef
    endfunction

" slime configure:
    let g:slime_target = "tmux"
    let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
    let g:slime_dont_ask_default = 1
    let g:slime_python_ipython = 1
    " nmap <c-c><c-c> <Plug>SlimeParagraphSend
    xmap <leader>si <Plug>SlimeRegionSend
    nmap <leader>sp <Plug>SlimeParagraphSend

" indentline AutoPairs, configure:
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_guide_size = 3
    let g:indent_guides_start_level = 2
    let g:AutoPairs = {'<':'>','(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
    " inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>

" rainbow configure:
    let g:rainbow_active = 1
	let g:rainbow_conf = {
        \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
        \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
        \   }

" MarkdownPreview & markdown configure:
    au bufread,bufnewfile *.md,*.markdown setlocal ft=mkd

    nmap <silent> <leader>mp <Plug>MarkdownPreview
    nmap <silent> <leader>mP <Plug>StopMarkdownPreview

" emmet-vim configure:
    " let g:user_emmet_install_global = 0
    " setlocal omnifunc=emmet#completeTag
    " let g:user_emmet_mode='inv'
    " let g:user_emmet_leader_key='<C-o>'
    " let g:user_emmet_settings = {
    "      \ 'javascript.jsx' : {
    "     \ 'extends' : 'jsx',
    "     \ },
    "      \ }
    " autocmd FileType css setlocal iskeyword+=-
    " autocmd FileType html,css EmmetInstall

" pangu configure:
    autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

" vim-devicons configure:
    let g:webdevicons_enable = 1

" winresizer configure:
    let g:winresizer_gui_enable = 1
    " If you want to start window resize mode by `Ctrl+T`
    let g:winresizer_start_key = '<Leader>ws'
    " If you cancel and quit window resize mode by `z` (keycode 122)
    let g:winresizer_keycode_cancel = 122


" plugins manager autodownload and keymap configure:
    if empty(glob(expand('$VIMRUNTIME/autoload/plug.vim')))
        silent !curl -fLo $VIMRUNTIME/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugUpdate --sync |source ~/.vimrc
    endif
    " Plug keymap configure:
    nnoremap <Leader>pi :PlugInstall<Cr>
    nnoremap <Leader>pc :PlugClean<Cr>
    nnoremap <Leader>pu :PlugUpdate<Cr>

"  < Plugin lists >
call plug#begin('~/.nvim/vimfiles/bundle')
     Plug 'mhinz/vim-startify'
     Plug 'flazz/vim-colorschemes'
     Plug 'itchyny/lightline.vim'
     Plug 'joshdick/onedark.vim'
     Plug 'sheerun/vim-polyglot'
     Plug 'junegunn/vim-easy-align'
     Plug 'tpope/vim-surround'
     Plug 'jiangmiao/auto-pairs'
     Plug 'tommcdo/vim-exchange'
     Plug 'https://github.com/mg979/vim-visual-multi.git'
     Plug 'tpope/vim-repeat'
     Plug 'scrooloose/nerdcommenter'
     Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
     Plug 'kristijanhusak/defx-icons'
     Plug 'kristijanhusak/defx-git'
     Plug 'ryanoasis/vim-devicons'
     Plug 'luochen1990/rainbow'
     Plug 'kshenoy/vim-signature'
     Plug 'airblade/vim-gitgutter'
     Plug 'neoclide/vim-easygit'
     " Plug 'mhinz/vim-signify' support more vcs
     " Plug 'tpope/vim-fugitive'
     " Plug 'python-mode/python-mode', { 'branch': 'develop' }

     " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
     " Plug 'deoplete-plugins/deoplete-jedi'
     " Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
     "
     Plug 'neoclide/coc.nvim', { 'branch': 'release' }
     Plug 'tenfyzhong/CompleteParameter.vim'
     " Plug 'davidhalter/jedi-vim'
     " Plug 'maralla/completor.vim'
     Plug 'Shougo/neosnippet.vim'
     Plug 'Shougo/neosnippet-snippets'
     Plug 'tell-k/vim-autopep8'
     Plug 'Chiel92/vim-autoformat'
     Plug 'dense-analysis/ale'
     " Plug 'neomake/neomake'
     Plug 'https://github.com/simnalamburt/vim-mundo.git'
     Plug 'jpalardy/vim-slime'
     Plug 'easymotion/vim-easymotion'
     Plug 'haya14busa/incsearch.vim'
     Plug 'haya14busa/vim-asterisk'
     Plug 'wellle/targets.vim'
     Plug 'markonm/traces.vim'                          " It also provides live preview for the following Ex commands
     Plug '/usr/local/opt/fzf'
     Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
     Plug 'junegunn/fzf.vim'
     Plug 'simeji/winresizer'
     Plug 'yonchu/accelerated-smooth-scroll'
     Plug 'nathanaelkane/vim-indent-guides'
     " Plug 'tmhedberg/SimpylFold'
     Plug 'hotoo/pangu.vim'
     Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
     Plug 'skywind3000/asyncrun.vim'
     Plug 'sillybun/vim-repl'
     " Plug 'plytophogy/vim-virtualenv'
     " Plug 'rizzatti/dash.vim'
     Plug 'dbeniamine/cheat.sh-vim'
     Plug 'mattn/emmet-vim'
     Plug 'othree/html5.vim'
     Plug 'hail2u/vim-css3-syntax'
     Plug 'ap/vim-css-color'
     Plug 'tpope/vim-obsession'
     Plug 'tpope/vim-abolish'
call plug#end()
