if dracula#should_abort('yaml')
    finish
endif

hi! link yamlAlias           NightscapeGreenItalicUnderline
hi! link yamlAnchor          NightscapePinkItalic
hi! link yamlBlockMappingKey NightscapeCyan
hi! link yamlFlowCollection  NightscapePink
hi! link yamlFlowIndicator   Delimiter
hi! link yamlNodeTag         NightscapePink
hi! link yamlPlainScalar     NightscapeYellow

