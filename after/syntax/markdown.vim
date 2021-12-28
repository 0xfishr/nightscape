if dracula#should_abort('markdown', 'mkd')
    finish
endif

if b:current_syntax ==# 'mkd'
" plasticboy/vim-markdown {{{1
  hi! link htmlBold       NightscapeOrangeBold
  hi! link htmlBoldItalic NightscapeOrangeBoldItalic
  hi! link htmlH1         NightscapePurpleBold
  hi! link htmlItalic     NightscapeYellowItalic
  hi! link mkdBlockquote  NightscapeYellowItalic
  hi! link mkdBold        NightscapeOrangeBold
  hi! link mkdBoldItalic  NightscapeOrangeBoldItalic
  hi! link mkdCode        NightscapeGreen
  hi! link mkdCodeEnd     NightscapeGreen
  hi! link mkdCodeStart   NightscapeGreen
  hi! link mkdHeading     NightscapePurpleBold
  hi! link mkdInlineUrl   NightscapeLink
  hi! link mkdItalic      NightscapeYellowItalic
  hi! link mkdLink        NightscapePink
  hi! link mkdListItem    NightscapeCyan
  hi! link mkdRule        NightscapeComment
  hi! link mkdUrl         NightscapeLink
"}}}1
elseif b:current_syntax ==# 'markdown'
" Builtin: {{{1
  hi! link markdownBlockquote        NightscapeCyan
  hi! link markdownBold              NightscapeOrangeBold
  hi! link markdownBoldItalic        NightscapeOrangeBoldItalic
  hi! link markdownCodeBlock         NightscapeGreen
  hi! link markdownCode              NightscapeGreen
  hi! link markdownCodeDelimiter     NightscapeGreen
  hi! link markdownH1                NightscapePurpleBold
  hi! link markdownH2                markdownH1
  hi! link markdownH3                markdownH1
  hi! link markdownH4                markdownH1
  hi! link markdownH5                markdownH1
  hi! link markdownH6                markdownH1
  hi! link markdownHeadingDelimiter  markdownH1
  hi! link markdownHeadingRule       markdownH1
  hi! link markdownItalic            NightscapeYellowItalic
  hi! link markdownLinkText          NightscapePink
  hi! link markdownListMarker        NightscapeCyan
  hi! link markdownOrderedListMarker NightscapeCyan
  hi! link markdownRule              NightscapeComment
  hi! link markdownUrl               NightscapeLink
"}}}
endif

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
