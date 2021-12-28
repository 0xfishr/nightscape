" Nightscape Theme: {{{
"
" https://github.com/zenorocha/nightscape-theme
"
" Copyright 2016, All rights reserved
"
" Code licensed under the MIT license
" http://zenorocha.mit-license.org
"
" @author Trevor Heins <@heinst>
" @author Éverton Ribeiro <nuxlli@gmail.com>
" @author Derek Sifford <dereksifford@gmail.com>
" @author Zeno Rocha <hi@zenorocha.com>
scriptencoding utf8
" }}}

" Configuration: {{{

if v:version > 580
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'nightscape'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" Palette: {{{2

let s:fg        = g:nightscape#palette.fg

let s:bglighter = g:nightscape#palette.bglighter
let s:bglight   = g:nightscape#palette.bglight
let s:bg        = g:nightscape#palette.bg
let s:bgdark    = g:nightscape#palette.bgdark
let s:bgdarker  = g:nightscape#palette.bgdarker

let s:comment   = g:nightscape#palette.comment
let s:selection = g:nightscape#palette.selection
let s:subtle    = g:nightscape#palette.subtle

let s:cyan      = g:nightscape#palette.cyan
let s:green     = g:nightscape#palette.green
let s:orange    = g:nightscape#palette.orange
let s:pink      = g:nightscape#palette.pink
let s:purple    = g:nightscape#palette.purple
let s:red       = g:nightscape#palette.red
let s:yellow    = g:nightscape#palette.yellow

let s:none      = ['NONE', 'NONE']

if has('nvim')
  for s:i in range(16)
    let g:terminal_color_{s:i} = g:nightscape#palette['color_' . s:i]
  endfor
endif

if has('terminal')
  let g:terminal_ansi_colors = []
  for s:i in range(16)
    call add(g:terminal_ansi_colors, g:nightscape#palette['color_' . s:i])
  endfor
endif

" }}}2
" User Configuration: {{{2

if !exists('g:nightscape_bold')
  let g:nightscape_bold = 1
endif

if !exists('g:nightscape_italic')
  let g:nightscape_italic = 1
endif

if !exists('g:nightscape_underline')
  let g:nightscape_underline = 1
endif

if !exists('g:nightscape_undercurl')
  let g:nightscape_undercurl = g:nightscape_underline
endif

if !exists('g:nightscape_full_special_attrs_support')
  let g:nightscape_full_special_attrs_support = has('gui_running')
endif

if !exists('g:nightscape_inverse')
  let g:nightscape_inverse = 1
endif

if !exists('g:nightscape_colorterm')
  let g:nightscape_colorterm = 1
endif

"}}}2
" Script Helpers: {{{2

let s:attrs = {
      \ 'bold': g:nightscape_bold == 1 ? 'bold' : 0,
      \ 'italic': g:nightscape_italic == 1 ? 'italic' : 0,
      \ 'underline': g:nightscape_underline == 1 ? 'underline' : 0,
      \ 'undercurl': g:nightscape_undercurl == 1 ? 'undercurl' : 0,
      \ 'inverse': g:nightscape_inverse == 1 ? 'inverse' : 0,
      \}

function! s:h(scope, fg, ...) " bg, attr_list, special
  let l:fg = copy(a:fg)
  let l:bg = get(a:, 1, ['NONE', 'NONE'])

  let l:attr_list = filter(get(a:, 2, ['NONE']), 'type(v:val) == 1')
  let l:attrs = len(l:attr_list) > 0 ? join(l:attr_list, ',') : 'NONE'

  " If the UI does not have full support for special attributes (like underline and
  " undercurl) and the highlight does not explicitly set the foreground color,
  " make the foreground the same as the attribute color to ensure the user will
  " get some highlight if the attribute is not supported. The default behavior
  " is to assume that terminals do not have full support, but the user can set
  " the global variable `g:nightscape_full_special_attrs_support` explicitly if the
  " default behavior is not desirable.
  let l:special = get(a:, 3, ['NONE', 'NONE'])
  if l:special[0] !=# 'NONE' && l:fg[0] ==# 'NONE' && !g:nightscape_full_special_attrs_support
    let l:fg[0] = l:special[0]
    let l:fg[1] = l:special[1]
  endif

  let l:hl_string = [
        \ 'highlight', a:scope,
        \ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
        \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
        \ 'gui=' . l:attrs, 'cterm=' . l:attrs,
        \ 'guisp=' . l:special[0],
        \]

  execute join(l:hl_string, ' ')
endfunction

"}}}2
" Nightscape Highlight Groups: {{{2

call s:h('NightscapeBgLight', s:none, s:bglight)
call s:h('NightscapeBgLighter', s:none, s:bglighter)
call s:h('NightscapeBgDark', s:none, s:bgdark)
call s:h('NightscapeBgDarker', s:none, s:bgdarker)

call s:h('NightscapeFg', s:fg)
call s:h('NightscapeFgUnderline', s:fg, s:none, [s:attrs.underline])
call s:h('NightscapeFgBold', s:fg, s:none, [s:attrs.bold])

call s:h('NightscapeComment', s:comment)
call s:h('NightscapeCommentBold', s:comment, s:none, [s:attrs.bold])

call s:h('NightscapeSelection', s:none, s:selection)

call s:h('NightscapeSubtle', s:subtle)

call s:h('NightscapeCyan', s:cyan)
call s:h('NightscapeCyanItalic', s:cyan, s:none, [s:attrs.italic])

call s:h('NightscapeGreen', s:green)
call s:h('NightscapeGreenBold', s:green, s:none, [s:attrs.bold])
call s:h('NightscapeGreenItalic', s:green, s:none, [s:attrs.italic])
call s:h('NightscapeGreenItalicUnderline', s:green, s:none, [s:attrs.italic, s:attrs.underline])

call s:h('NightscapeOrange', s:orange)
call s:h('NightscapeOrangeBold', s:orange, s:none, [s:attrs.bold])
call s:h('NightscapeOrangeItalic', s:orange, s:none, [s:attrs.italic])
call s:h('NightscapeOrangeBoldItalic', s:orange, s:none, [s:attrs.bold, s:attrs.italic])
call s:h('NightscapeOrangeInverse', s:bg, s:orange)

call s:h('NightscapePink', s:pink)
call s:h('NightscapePinkItalic', s:pink, s:none, [s:attrs.italic])

call s:h('NightscapePurple', s:purple)
call s:h('NightscapePurpleBold', s:purple, s:none, [s:attrs.bold])
call s:h('NightscapePurpleItalic', s:purple, s:none, [s:attrs.italic])

call s:h('NightscapeRed', s:red)
call s:h('NightscapeRedInverse', s:fg, s:red)

call s:h('NightscapeYellow', s:yellow)
call s:h('NightscapeYellowItalic', s:yellow, s:none, [s:attrs.italic])

call s:h('NightscapeError', s:red, s:none, [], s:red)

call s:h('NightscapeErrorLine', s:none, s:none, [s:attrs.undercurl], s:red)
call s:h('NightscapeWarnLine', s:none, s:none, [s:attrs.undercurl], s:orange)
call s:h('NightscapeInfoLine', s:none, s:none, [s:attrs.undercurl], s:cyan)

call s:h('NightscapeTodo', s:cyan, s:none, [s:attrs.bold, s:attrs.inverse])
call s:h('NightscapeSearch', s:green, s:none, [s:attrs.inverse])
call s:h('NightscapeBoundary', s:comment, s:bgdark)
call s:h('NightscapeLink', s:cyan, s:none, [s:attrs.underline])

call s:h('NightscapeDiffChange', s:orange, s:none)
call s:h('NightscapeDiffText', s:bg, s:orange)
call s:h('NightscapeDiffDelete', s:red, s:bgdark)

" }}}2

" }}}
" User Interface: {{{

set background=dark

" Required as some plugins will overwrite
call s:h('Normal', s:fg, g:nightscape_colorterm || has('gui_running') ? s:bg : s:none )
call s:h('StatusLine', s:none, s:bglighter, [s:attrs.bold])
call s:h('StatusLineNC', s:none, s:bglight)
call s:h('StatusLineTerm', s:none, s:bglighter, [s:attrs.bold])
call s:h('StatusLineTermNC', s:none, s:bglight)
call s:h('WildMenu', s:bg, s:purple, [s:attrs.bold])
call s:h('CursorLine', s:none, s:subtle)

hi! link ColorColumn  NightscapeBgDark
hi! link CursorColumn CursorLine
hi! link CursorLineNr NightscapeYellow
hi! link DiffAdd      NightscapeGreen
hi! link DiffAdded    DiffAdd
hi! link DiffChange   NightscapeDiffChange
hi! link DiffDelete   NightscapeDiffDelete
hi! link DiffRemoved  DiffDelete
hi! link DiffText     NightscapeDiffText
hi! link Directory    NightscapePurpleBold
hi! link ErrorMsg     NightscapeRedInverse
hi! link FoldColumn   NightscapeSubtle
hi! link Folded       NightscapeBoundary
hi! link IncSearch    NightscapeOrangeInverse
call s:h('LineNr', s:comment)
hi! link MoreMsg      NightscapeFgBold
hi! link NonText      NightscapeSubtle
hi! link Pmenu        NightscapeBgDark
hi! link PmenuSbar    NightscapeBgDark
hi! link PmenuSel     NightscapeSelection
hi! link PmenuThumb   NightscapeSelection
hi! link Question     NightscapeFgBold
hi! link Search       NightscapeSearch
call s:h('SignColumn', s:comment)
hi! link TabLine      NightscapeBoundary
hi! link TabLineFill  NightscapeBgDark
hi! link TabLineSel   Normal
hi! link Title        NightscapeGreenBold
hi! link VertSplit    NightscapeBoundary
hi! link Visual       NightscapeSelection
hi! link VisualNOS    Visual
hi! link WarningMsg   NightscapeOrangeInverse

" }}}
" Syntax: {{{

" Required as some plugins will overwrite
call s:h('MatchParen', s:green, s:none, [s:attrs.underline])
call s:h('Conceal', s:cyan, s:none)

" Neovim uses SpecialKey for escape characters only. Vim uses it for that, plus whitespace.
if has('nvim')
  hi! link SpecialKey NightscapeRed
  hi! link LspReferenceText NightscapeSelection
  hi! link LspReferenceRead NightscapeSelection
  hi! link LspReferenceWrite NightscapeSelection
  " Link old 'LspDiagnosticsDefault*' hl groups
  " for backward compatibility with neovim v0.5.x
  hi! link LspDiagnosticsDefaultInformation DiagnosticInfo
  hi! link LspDiagnosticsDefaultHint DiagnosticHint
  hi! link LspDiagnosticsDefaultError DiagnosticError
  hi! link LspDiagnosticsDefaultWarning DiagnosticWarn
  hi! link LspDiagnosticsUnderlineError DiagnosticUnderlineError
  hi! link LspDiagnosticsUnderlineHint DiagnosticUnderlineHint
  hi! link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInfo
  hi! link LspDiagnosticsUnderlineWarning DiagnosticUnderlineWarn
  
  hi! link DiagnosticInfo NightscapeCyan
  hi! link DiagnosticHint NightscapeCyan
  hi! link DiagnosticError NightscapeError
  hi! link DiagnosticWarn NightscapeOrange
  hi! link DiagnosticUnderlineError NightscapeErrorLine
  hi! link DiagnosticUnderlineHint NightscapeInfoLine
  hi! link DiagnosticUnderlineInfo NightscapeInfoLine
  hi! link DiagnosticUnderlineWarn NightscapeWarnLine
else
  hi! link SpecialKey NightscapePink
endif

hi! link Comment NightscapeComment
hi! link Underlined NightscapeFgUnderline
hi! link Todo NightscapeTodo

hi! link Error NightscapeError
hi! link SpellBad NightscapeErrorLine
hi! link SpellLocal NightscapeWarnLine
hi! link SpellCap NightscapeInfoLine
hi! link SpellRare NightscapeInfoLine

hi! link Constant NightscapePurple
hi! link String NightscapeYellow
hi! link Character NightscapePink
hi! link Number Constant
hi! link Boolean Constant
hi! link Float Constant

hi! link Identifier NightscapeFg
hi! link Function NightscapeGreen

hi! link Statement NightscapePink
hi! link Conditional NightscapePink
hi! link Repeat NightscapePink
hi! link Label NightscapePink
hi! link Operator NightscapePink
hi! link Keyword NightscapePink
hi! link Exception NightscapePink

hi! link PreProc NightscapePink
hi! link Include NightscapePink
hi! link Define NightscapePink
hi! link Macro NightscapePink
hi! link PreCondit NightscapePink
hi! link StorageClass NightscapePink
hi! link Structure NightscapePink
hi! link Typedef NightscapePink

hi! link Type NightscapeCyanItalic

hi! link Delimiter NightscapeFg

hi! link Special NightscapePink
hi! link SpecialComment NightscapeCyanItalic
hi! link Tag NightscapeCyan
hi! link helpHyperTextJump NightscapeLink
hi! link helpCommand NightscapePurple
hi! link helpExample NightscapeGreen
hi! link helpBacktick Special

"}}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0 et:
