" CtrlP ===============================================================================================================

" Set searching by filename (as opposed to full path)
let g:ctrlp_by_filename = 1

" Enable the lazy-update feature: only update the match window after typing's
" been stopped for a certain amount of time, 1 = 250ms
let g:ctrlp_lazy_update = 100

" How the newly created file is to be opened when pressing
" let g:ctrlp_open_new_file = 't' " In this case open in new tab

" This will open multiple selected file in a new tab
let g:ctrlp_open_multiple_files = 't'

" The nearest ancestor of the current file that contains one of these directories or files: .git .hg .svn .bzr _darcs
let g:ctrlp_working_path_mode = 'ra'

" The maximum depth of a directory tree to recurse into
let g:ctrlp_max_depth = 6

" Exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" For ignoring files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Set this to list of names to customize core types
" let g:ctrlp_types = ['fil', 'buf']

