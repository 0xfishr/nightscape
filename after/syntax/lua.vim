if dracula#should_abort('lua')
    finish
endif

hi! link luaFunc  NightscapeCyan
hi! link luaTable NightscapeFg

" tbastos/vim-lua {{{

hi! link luaBraces       NightscapeFg
hi! link luaBuiltIn      Constant
hi! link luaDocTag       Keyword
hi! link luaErrHand      NightscapeCyan
hi! link luaFuncArgName  NightscapeOrangeItalic
hi! link luaFuncCall     Function
hi! link luaLocal        Keyword
hi! link luaSpecialTable Constant
hi! link luaSpecialValue NightscapeCyan

" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
