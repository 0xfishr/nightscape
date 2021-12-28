if dracula#should_abort('rst')
    finish
endif

hi! link rstComment                             Comment
hi! link rstTransition                          Comment
hi! link rstCodeBlock                           NightscapeGreen
hi! link rstInlineLiteral                       NightscapeGreen
hi! link rstLiteralBlock                        NightscapeGreen
hi! link rstQuotedLiteralBlock                  NightscapeGreen
hi! link rstStandaloneHyperlink                 NightscapeLink
hi! link rstStrongEmphasis                      NightscapeOrangeBold
hi! link rstSections                            NightscapePurpleBold
hi! link rstEmphasis                            NightscapeYellowItalic
hi! link rstDirective                           Keyword
hi! link rstSubstitutionDefinition              Keyword
hi! link rstCitation                            String
hi! link rstExDirective                         String
hi! link rstFootnote                            String
hi! link rstCitationReference                   Tag
hi! link rstFootnoteReference                   Tag
hi! link rstHyperLinkReference                  Tag
hi! link rstHyperlinkTarget                     Tag
hi! link rstInlineInternalTargets               Tag
hi! link rstInterpretedTextOrHyperlinkReference Tag
hi! link rstTodo                                Todo
