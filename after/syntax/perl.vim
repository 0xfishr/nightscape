if dracula#should_abort('perl')
    finish
endif

" Regex
hi! link perlMatchStartEnd       NightscapeRed

" Builtin functions
hi! link perlOperator            NightscapeCyan
hi! link perlStatementFiledesc   NightscapeCyan
hi! link perlStatementFiles      NightscapeCyan
hi! link perlStatementFlow       NightscapeCyan
hi! link perlStatementHash       NightscapeCyan
hi! link perlStatementIOfunc     NightscapeCyan
hi! link perlStatementIPC        NightscapeCyan
hi! link perlStatementList       NightscapeCyan
hi! link perlStatementMisc       NightscapeCyan
hi! link perlStatementNetwork    NightscapeCyan
hi! link perlStatementNumeric    NightscapeCyan
hi! link perlStatementProc       NightscapeCyan
hi! link perlStatementPword      NightscapeCyan
hi! link perlStatementRegexp     NightscapeCyan
hi! link perlStatementScalar     NightscapeCyan
hi! link perlStatementSocket     NightscapeCyan
hi! link perlStatementTime       NightscapeCyan
hi! link perlStatementVector     NightscapeCyan

" Highlighting for quoting constructs, tied to existing option in vim-perl
if get(g:, 'perl_string_as_statement', 0)
  hi! link perlStringStartEnd NightscapeRed
endif

" Signatures
hi! link perlSignature           NightscapeOrangeItalic
hi! link perlSubPrototype        NightscapeOrangeItalic

" Hash keys
hi! link perlVarSimpleMemberName NightscapePurple
