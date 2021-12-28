if dracula#should_abort('javascript', 'javascriptreact', 'javascript.jsx')
  finish
endif

hi! link javaScriptBraces   Delimiter
hi! link javaScriptNumber   Constant
hi! link javaScriptNull     Constant
hi! link javaScriptFunction Keyword

" pangloss/vim-javascript {{{

hi! link jsArrowFunction           Operator
hi! link jsBuiltins                NightscapeCyan
hi! link jsClassDefinition         NightscapeCyan
hi! link jsClassMethodType         Keyword
hi! link jsDestructuringAssignment NightscapeOrangeItalic
hi! link jsDocParam                NightscapeOrangeItalic
hi! link jsDocTags                 Keyword
hi! link jsDocType                 Type
hi! link jsDocTypeBrackets         NightscapeCyan
hi! link jsFuncArgOperator         Operator
hi! link jsFuncArgs                NightscapeOrangeItalic
hi! link jsFunction                Keyword
hi! link jsNull                    Constant
hi! link jsObjectColon             NightscapePink
hi! link jsSuper                   NightscapePurpleItalic
hi! link jsTemplateBraces          Special
hi! link jsThis                    NightscapePurpleItalic
hi! link jsUndefined               Constant

"}}}

" maxmellon/vim-jsx-pretty {{{

hi! link jsxTag             Keyword
hi! link jsxTagName         Keyword
hi! link jsxComponentName   Type
hi! link jsxCloseTag        Type
hi! link jsxAttrib          NightscapePink
hi! link jsxCloseString     Identifier
hi! link jsxOpenPunct       Identifier

" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0: