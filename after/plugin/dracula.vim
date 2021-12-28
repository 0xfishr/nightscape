if nightscape#should_abort()
  finish
endif

" Fzf: {{{
if exists('g:loaded_fzf') && ! exists('g:fzf_colors')
  let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Search'],
    \ 'fg+':     ['fg', 'Normal'],
    \ 'bg+':     ['bg', 'Normal'],
    \ 'hl+':     ['fg', 'NightscapeOrange'],
    \ 'info':    ['fg', 'NightscapePurple'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'NightscapeGreen'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'],
    \}
endif
"}}}
" ALE: {{{
if exists('g:ale_enabled')
  hi! link ALEError              NightscapeErrorLine
  hi! link ALEWarning            NightscapeWarnLine
  hi! link ALEInfo               NightscapeInfoLine

  hi! link ALEErrorSign          NightscapeRed
  hi! link ALEWarningSign        NightscapeOrange
  hi! link ALEInfoSign           NightscapeCyan

  hi! link ALEVirtualTextError   Comment
  hi! link ALEVirtualTextWarning Comment
endif
" }}}
" CtrlP: {{{
if exists('g:loaded_ctrlp')
  hi! link CtrlPMatch     IncSearch
  hi! link CtrlPBufferHid Normal
endif
" }}}
" GitGutter / gitsigns: {{{
if exists('g:loaded_gitgutter')
  hi! link GitGutterAdd    DiffAdd
  hi! link GitGutterChange DiffChange
  hi! link GitGutterDelete DiffDelete
endif
if has('nvim-0.5') && luaeval("pcall(require, 'gitsigns')")
  " https://github.com/lewis6991/gitsigns.nvim requires nvim > 0.5
  " has('nvim-0.5') checks >= 0.5, so this should be future-proof.
  hi! link GitSignsAdd      DiffAdd
  hi! link GitSignsAddLn    DiffAdd
  hi! link GitSignsAddNr    DiffAdd
  hi! link GitSignsChange   DiffChange
  hi! link GitSignsChangeLn DiffChange
  hi! link GitSignsChangeNr DiffChange
  hi! link GitSignsDelete   DiffDelete
  hi! link GitSignsDeleteLn DiffDelete
  hi! link GitSignsDeleteNr DiffDelete
endif
" }}}
" Tree-sitter: {{{
" The nvim-treesitter library defines many global highlight groups that are
" linked to the regular vim syntax highlight groups. We only need to redefine
" those highlight groups when the defaults do not match the nightscape
" specification.
" https://github.com/nvim-treesitter/nvim-treesitter/blob/master/plugin/nvim-treesitter.vim
if exists('g:loaded_nvim_treesitter')
  " # Misc
  hi! link TSPunctSpecial Special
  " # Constants
  hi! link TSConstMacro Macro
  hi! link TSStringEscape Character
  hi! link TSSymbol NightscapePurple
  hi! link TSAnnotation NightscapeYellow
  hi! link TSAttribute NightscapeGreenItalic
  " # Functions
  hi! link TSFuncBuiltin NightscapeCyan
  hi! link TSFuncMacro Function
  hi! link TSParameter NightscapeOrangeItalic
  hi! link TSParameterReference NightscapeOrange
  hi! link TSField NightscapeOrange
  hi! link TSConstructor NightscapeCyan
  " # Keywords
  hi! link TSLabel NightscapePurpleItalic
  " # Variable
  hi! link TSVariableBuiltin NightscapePurpleItalic
  " # Text
  hi! link TSStrong NightscapeFgBold
  hi! link TSEmphasis NightscapeFg
  hi! link TSUnderline Underlined
  hi! link TSTitle NightscapeYellow
  hi! link TSLiteral NightscapeYellow
  hi! link TSURI NightscapeYellow
  " HTML and JSX tag attributes. By default, this group is linked to TSProperty,
  " which in turn links to Identifer (white).
  hi! link TSTagAttribute NightscapePurpleItalic
endif
" }}}
" nvim-cmp: {{{
" A completion engine plugin for neovim written in Lua.
" https://github.com/hrsh7th/nvim-cmp
if exists('g:loaded_cmp')
  hi! link CmpItemAbbrDeprecated NightscapeError

  hi! link CmpItemAbbrMatch NightscapeFg
  hi! link CmpItemAbbrMatchFuzzy NightscapeFg

  hi! link CmpItemKindText NightscapeFg
  hi! link CmpItemKindMethod Function
  hi! link CmpItemKindFunction Function
  hi! link CmpItemKindConstructor NightscapeCyan
  hi! link CmpItemKindField NightscapeOrange
  hi! link CmpItemKindVariable NightscapePurpleItalic
  hi! link CmpItemKindClass NightscapeCyan
  hi! link CmpItemKindInterface NightscapeCyan
  hi! link CmpItemKindModule NightscapeYellow
  hi! link CmpItemKindProperty NightscapePink
  hi! link CmpItemKindUnit NightscapeFg
  hi! link CmpItemKindValue NightscapeYellow
  hi! link CmpItemKindEnum NightscapePink
  hi! link CmpItemKindKeyword NightscapePink
  hi! link CmpItemKindSnippet NightscapeFg
  hi! link CmpItemKindColor NightscapeYellow
  hi! link CmpItemKindFile NightscapeYellow
  hi! link CmpItemKindReference NightscapeOrange
  hi! link CmpItemKindFolder NightscapeYellow
  hi! link CmpItemKindEnumMember NightscapePurple
  hi! link CmpItemKindConstant NightscapePurple
  hi! link CmpItemKindStruct NightscapePink
  hi! link CmpItemKindEvent NightscapeFg
  hi! link CmpItemKindOperator NightscapePink
  hi! link CmpItemKindTypeParameter NightscapeCyan
endif
" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
