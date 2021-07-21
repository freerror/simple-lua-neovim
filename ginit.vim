if exists(':GuiTabline')
    GuiTabline 0
endif

" Ensure we're full screen
call GuiWindowMaximized(1)
" Typing `set guifont=*` brings up a font picker
GuiFont! Fira\ Code\ Medium:h9
set linespace=-1
