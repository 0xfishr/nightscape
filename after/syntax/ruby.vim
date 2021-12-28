if dracula#should_abort('ruby')
    finish
endif

if ! exists('g:ruby_operators')
    let g:ruby_operators=1
endif

hi! link rubyBlockArgument          NightscapeOrangeItalic
hi! link rubyBlockParameter         NightscapeOrangeItalic
hi! link rubyCurlyBlock             NightscapePink
hi! link rubyGlobalVariable         NightscapePurple
hi! link rubyInstanceVariable       NightscapePurpleItalic
hi! link rubyInterpolationDelimiter NightscapePink
hi! link rubyRegexpDelimiter        NightscapeRed
hi! link rubyStringDelimiter        NightscapeYellow
