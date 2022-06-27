GuiFont JetBrains Mono
GuiTabline 0

nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>

nnoremap <C-d> :Dashboard <CR>

set clipboard^=unnamed,unnamedplus

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
inoremap <leader>p "+gp
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
