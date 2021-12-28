" Palette: {{{

let g:nightscape#palette           = {}
let g:nightscape#palette.fg        = ['#F8F8F2', 253]

let g:nightscape#palette.bglighter = ['#424450', 238]
let g:nightscape#palette.bglight   = ['#343746', 237]
let g:nightscape#palette.bg        = ['#201b2d', 236]
let g:nightscape#palette.bgdark    = ['#21222C', 235]
let g:nightscape#palette.bgdarker  = ['#191A21', 234]

let g:nightscape#palette.comment   = ['#6272A4',  61]
let g:nightscape#palette.selection = ['#44475A', 239]
let g:nightscape#palette.subtle    = ['#424450', 238]

let g:nightscape#palette.cyan      = ['#A1EFE4', 117]
let g:nightscape#palette.green     = ['#67E480',  84]
let g:nightscape#palette.orange    = ['#FFB86C', 215]
let g:nightscape#palette.pink      = ['#FF79C6', 212]
let g:nightscape#palette.purple    = ['#988BC7', 141]
let g:nightscape#palette.red       = ['#ED4556', 203]
let g:nightscape#palette.yellow    = ['#E7DE79', 228]

"
" ANSI
"
let g:nightscape#palette.color_0  = '#21222C'
let g:nightscape#palette.color_1  = '#FF5555'
let g:nightscape#palette.color_2  = '#50FA7B'
let g:nightscape#palette.color_3  = '#F1FA8C'
let g:nightscape#palette.color_4  = '#BD93F9'
let g:nightscape#palette.color_5  = '#FF79C6'
let g:nightscape#palette.color_6  = '#8BE9FD'
let g:nightscape#palette.color_7  = '#F8F8F2'
let g:nightscape#palette.color_8  = '#6272A4'
let g:nightscape#palette.color_9  = '#FF6E6E'
let g:nightscape#palette.color_10 = '#69FF94'
let g:nightscape#palette.color_11 = '#FFFFA5'
let g:nightscape#palette.color_12 = '#D6ACFF'
let g:nightscape#palette.color_13 = '#FF92DF'
let g:nightscape#palette.color_14 = '#A4FFFF'
let g:nightscape#palette.color_15 = '#FFFFFF'

" }}}

" Helper function that takes a variadic list of filetypes as args and returns
" whether or not the execution of the ftplugin should be aborted.
func! nightscape#should_abort(...)
    if ! exists('g:colors_name') || g:colors_name !=# 'nightscape'
        return 1
    elseif a:0 > 0 && (! exists('b:current_syntax') || index(a:000, b:current_syntax) == -1)
        return 1
    endif
    return 0
endfunction

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0: