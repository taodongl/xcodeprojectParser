grammar XCode;

compilationUnit    :   block? EOF;

block
    : '{' statement* '}' ';'?
    ;
statement
    : ROOT_OBJECT '=' GuidWithComment ';'       #rootObjectExpression
    | OBJECTS '=' block                         #objects
    | (
        blockStatement
        | simpleStatement
        | parensStatement
      ) # normalStatements
    | (
        entryPBXBuildFile
        | entryPBXCopyFilesBuildPhase
        | entryPBXFileReference
        | entryPBXFrameworksBuildPhase
        | entryPBXGroup
        | entryPBXNativeTarget
        | entryPBXProject
        | entryPBXSourcesBuildPhase
        | entryXCBuildConfiguration
        | entryXCConfigurationList
        | entryPBXAggregateTarget
        | entryPBXContainerItemProxy
        | entryPBXResourcesBuildPhase
        | entryPBXShellScriptBuildPhase
        | entryPBXTargetDependency
        | entryPBXVariantGroup
        | entryPBXReferenceProxy
        | entryPBXHeadersBuildPhase
        | entryPBXBuildRule
        | entryPBXLegacyTarget
        | entryPBXAppleScriptBuildPhase
      ) # entryStatements
    ;
blockStatement
    : id '=' block
    ;
parensStatement
    : id '=' '(' assignment (',' assignment)* ','? ')' ';'                  #assignmentListExpression
    | id '=' '(' GuidWithComment (',' GuidWithComment)* ','? ')' ';'        #guidListExpression
    | id '=' '(' id (',' id)* ','? ')' ';'                                  #literalListExpression
    | id '=' '(' block (',' block)* ','? ')' ';'                            #blockListExpression
    | id '=' '(' ')' ';'                                                    #emptyParens
    ;
simpleStatement
    : assignment ';'
    ;
assignment
    : id '=' value
    ;
value
    : ( PBXBuildFile
      | PBXCopyFilesBuildPhase
      | PBXFileReference
      | PBXFrameworksBuildPhase
      | PBXGroup
      | PBXNativeTarget
      | PBXProject
      | PBXSourcesBuildPhase
      | XCBuildConfiguration
      | XCConfigurationList
      | PBXAggregateTarget
      | PBXContainerItemProxy
      | PBXResourcesBuildPhase
      | PBXShellScriptBuildPhase
      | PBXTargetDependency
      | PBXVariantGroup
      | PBXReferenceProxy
      | PBXHeadersBuildPhase
      | PBXBuildRule
      | PBXLegacyTarget
      | PBXAppleScriptBuildPhase
      ) #keyword
    | id ('.' id)*                         #literal
    | STRING_LITERAL                       #stringLiteral
    | URL                                  #url
    ;
entryPBXBuildFile
    : pbXBuildFileStart blockStatement* pbXBuildFileEnd
    ;
entryPBXCopyFilesBuildPhase
    : pbXCopyFilesBuildPhaseStart blockStatement* pbXCopyFilesBuildPhaseEnd
    ;
entryPBXFileReference
    : pbXFileReferenceStart blockStatement* pbXFileReferenceEnd
    ;
entryPBXFrameworksBuildPhase
    : pbXFrameworksBuildPhaseStart blockStatement* pbXFrameworksBuildPhaseEnd
    ;
entryPBXGroup
    : pbXGroupStart blockStatement* pbXGroupEnd
    ;
entryPBXNativeTarget
    : pbXNativeTargetStart blockStatement* pbXNativeTargetEnd
    ;
entryPBXProject
    : pbXProjectStart blockStatement* pbXProjectEnd
    ;
entryPBXSourcesBuildPhase
    : pbXSourcesBuildPhaseStart blockStatement* pbXSourcesBuildPhaseEnd
    ;
entryXCBuildConfiguration
    : startXCBuildConfiguration blockStatement* endXCBuildConfiguration
    ;
entryXCConfigurationList
    : startXCConfigurationList blockStatement* endXCConfigurationList
    ;
entryPBXAggregateTarget
    : startPBXAggregateTarget blockStatement* endPBXAggregateTarget
    ;
entryPBXContainerItemProxy
    : startPBXContainerItemProxy blockStatement* endPBXContainerItemProxy
    ;
entryPBXResourcesBuildPhase
    : startPBXResourcesBuildPhase blockStatement* endPBXResourcesBuildPhase
    ;
entryPBXShellScriptBuildPhase
    : startPBXShellScriptBuildPhase blockStatement* endPBXShellScriptBuildPhase
    ;
entryPBXTargetDependency
    : startPBXTargetDependency blockStatement* endPBXTargetDependency
    ;
entryPBXVariantGroup
    : startPBXVariantGroup blockStatement* endPBXVariantGroup
    ;
entryPBXReferenceProxy
    : startPBXReferenceProxy blockStatement* endPBXReferenceProxy
    ;
entryPBXHeadersBuildPhase
    : startPBXHeadersBuildPhase blockStatement* endPBXHeadersBuildPhase
    ;
entryPBXBuildRule
    : startPBXBuildRule blockStatement* endPBXBuildRule
    ;
entryPBXLegacyTarget
    : startPBXLegacyTarget blockStatement* endPBXLegacyTarget
    ;
entryPBXAppleScriptBuildPhase
    : startPBXAppleScriptBuildPhase blockStatement* endPBXAppleScriptBuildPhase
    ;
id
    : GuidWithComment
    | ISA
    | IDENTIFIER
    | STRING_LITERAL
    | URL
    ;

pbXBuildFileStart
    : MUL_OPEN Begin PBXBuildFile Section MUL_CLOSE;
pbXBuildFileEnd
    : MUL_OPEN End PBXBuildFile Section MUL_CLOSE;
pbXCopyFilesBuildPhaseStart
    : MUL_OPEN Begin PBXCopyFilesBuildPhase Section MUL_CLOSE;
pbXCopyFilesBuildPhaseEnd
    : MUL_OPEN End PBXCopyFilesBuildPhase Section MUL_CLOSE;
pbXFileReferenceStart
    : MUL_OPEN Begin PBXFileReference Section MUL_CLOSE;
pbXFileReferenceEnd
    : MUL_OPEN End PBXFileReference Section MUL_CLOSE;
pbXFrameworksBuildPhaseStart
    : MUL_OPEN Begin PBXFrameworksBuildPhase Section MUL_CLOSE;
pbXFrameworksBuildPhaseEnd
    : MUL_OPEN End PBXFrameworksBuildPhase Section MUL_CLOSE;
pbXGroupStart
    : MUL_OPEN Begin PBXGroup Section MUL_CLOSE;
pbXGroupEnd
    : MUL_OPEN End PBXGroup Section MUL_CLOSE;
pbXNativeTargetStart
    : MUL_OPEN Begin PBXNativeTarget Section MUL_CLOSE;
pbXNativeTargetEnd
    : MUL_OPEN End PBXNativeTarget Section MUL_CLOSE;
pbXProjectStart
    : MUL_OPEN Begin PBXProject Section MUL_CLOSE;
pbXProjectEnd
    : MUL_OPEN End PBXProject Section MUL_CLOSE;
pbXSourcesBuildPhaseStart
    : MUL_OPEN Begin PBXSourcesBuildPhase Section MUL_CLOSE;
pbXSourcesBuildPhaseEnd
    : MUL_OPEN End PBXSourcesBuildPhase Section MUL_CLOSE;
startXCBuildConfiguration
    : MUL_OPEN Begin XCBuildConfiguration Section MUL_CLOSE;
endXCBuildConfiguration
    : MUL_OPEN End XCBuildConfiguration Section MUL_CLOSE;
startXCConfigurationList
    : MUL_OPEN Begin XCConfigurationList Section MUL_CLOSE;
endXCConfigurationList
    : MUL_OPEN End XCConfigurationList Section MUL_CLOSE;
startPBXAggregateTarget
    : MUL_OPEN Begin PBXAggregateTarget Section MUL_CLOSE;
endPBXAggregateTarget
    : MUL_OPEN End PBXAggregateTarget Section MUL_CLOSE;
startPBXContainerItemProxy
    : MUL_OPEN Begin PBXContainerItemProxy Section MUL_CLOSE;
endPBXContainerItemProxy
    : MUL_OPEN End PBXContainerItemProxy Section MUL_CLOSE;
startPBXResourcesBuildPhase
    : MUL_OPEN Begin PBXResourcesBuildPhase Section MUL_CLOSE;
endPBXResourcesBuildPhase
    : MUL_OPEN End PBXResourcesBuildPhase Section MUL_CLOSE;
startPBXShellScriptBuildPhase
    : MUL_OPEN Begin PBXShellScriptBuildPhase Section MUL_CLOSE;
endPBXShellScriptBuildPhase
    : MUL_OPEN End PBXShellScriptBuildPhase Section MUL_CLOSE;
startPBXTargetDependency
    : MUL_OPEN Begin PBXTargetDependency Section MUL_CLOSE;
endPBXTargetDependency
    : MUL_OPEN End PBXTargetDependency Section MUL_CLOSE;
startPBXVariantGroup
    : MUL_OPEN Begin PBXVariantGroup Section MUL_CLOSE;
endPBXVariantGroup
    : MUL_OPEN End PBXVariantGroup Section MUL_CLOSE;
startPBXReferenceProxy
    : MUL_OPEN Begin PBXReferenceProxy Section MUL_CLOSE;
endPBXReferenceProxy
    : MUL_OPEN End PBXReferenceProxy Section MUL_CLOSE;
startPBXHeadersBuildPhase
    : MUL_OPEN Begin PBXHeadersBuildPhase Section MUL_CLOSE;
endPBXHeadersBuildPhase
    : MUL_OPEN End PBXHeadersBuildPhase Section MUL_CLOSE;
startPBXBuildRule
    : MUL_OPEN Begin PBXBuildRule Section MUL_CLOSE;
endPBXBuildRule
    : MUL_OPEN End PBXBuildRule Section MUL_CLOSE;
startPBXLegacyTarget
    : MUL_OPEN Begin PBXLegacyTarget Section MUL_CLOSE;
endPBXLegacyTarget
    : MUL_OPEN End PBXLegacyTarget Section MUL_CLOSE;
startPBXAppleScriptBuildPhase
    : MUL_OPEN Begin PBXAppleScriptBuildPhase Section MUL_CLOSE;
endPBXAppleScriptBuildPhase
    : MUL_OPEN End PBXAppleScriptBuildPhase Section MUL_CLOSE;


SINGLE_LINE_COMMENT:     '//'  .*?  NewLine         -> skip;
WHITESPACES:             (Whitespace | NewLine)+    -> skip;
MUL_OPEN:               '/*';
MUL_CLOSE:              '*/';
PBXBuildFile:                   'PBXBuildFile';
PBXCopyFilesBuildPhase:         'PBXCopyFilesBuildPhase';
PBXFileReference:               'PBXFileReference';
PBXFrameworksBuildPhase:        'PBXFrameworksBuildPhase';
PBXGroup:                       'PBXGroup';
PBXNativeTarget:                'PBXNativeTarget';
PBXProject:                     'PBXProject';
PBXSourcesBuildPhase:           'PBXSourcesBuildPhase';
XCBuildConfiguration:           'XCBuildConfiguration';
XCConfigurationList:            'XCConfigurationList';
PBXAggregateTarget:             'PBXAggregateTarget';
PBXContainerItemProxy:          'PBXContainerItemProxy';
PBXResourcesBuildPhase:         'PBXResourcesBuildPhase';
PBXShellScriptBuildPhase:       'PBXShellScriptBuildPhase';
PBXTargetDependency:            'PBXTargetDependency';
PBXVariantGroup:                'PBXVariantGroup';
PBXReferenceProxy:              'PBXReferenceProxy';
PBXHeadersBuildPhase:           'PBXHeadersBuildPhase';
PBXBuildRule:                   'PBXBuildRule';
PBXLegacyTarget:                'PBXLegacyTarget';
PBXAppleScriptBuildPhase:       'PBXAppleScriptBuildPhase';
Begin:                  'Begin';
End:                    'End';
Section:                'section';
ISA:                    'isa';
ROOT_OBJECT:            'rootObject';
OBJECTS:                'objects';
GuidWithComment:        Guid (Whitespace+ '/*' .*? '*/')?;
IDENTIFIER:             [_0-9A-Za-z]+;
URL:                    [_0-9A-Za-z./]+;
STRING_LITERAL:         '"' ( EscapeSequence | ~["\\] )* '"';
fragment  Guid
    : UID UID UID UID UID UID UID UID UID UID UID UID UID UID UID UID UID UID UID UID UID UID UID UID
    ;
fragment UID:           [0-9A-Z];
fragment NewLine
	: '\r\n' | '\r' | '\n'
	| '\u0085' // <Next Line CHARACTER (U+0085)>'
	| '\u2028' //'<Line Separator CHARACTER (U+2028)>'
	| '\u2029' //'<Paragraph Separator CHARACTER (U+2029)>'
	;
fragment Whitespace
	: UnicodeClassZS //'<Any Character With Unicode Class Zs>'
	| '\u0009' //'<Horizontal Tab Character (U+0009)>'
	| '\u000B' //'<Vertical Tab Character (U+000B)>'
	| '\u000C' //'<Form Feed Character (U+000C)>'
	;
fragment UnicodeClassZS
	: '\u0020' // SPACE
	| '\u00A0' // NO_BREAK SPACE
	| '\u1680' // OGHAM SPACE MARK
	| '\u180E' // MONGOLIAN VOWEL SEPARATOR
	| '\u2000' // EN QUAD
	| '\u2001' // EM QUAD
	| '\u2002' // EN SPACE
	| '\u2003' // EM SPACE
	| '\u2004' // THREE_PER_EM SPACE
	| '\u2005' // FOUR_PER_EM SPACE
	| '\u2006' // SIX_PER_EM SPACE
	| '\u2008' // PUNCTUATION SPACE
	| '\u2009' // THIN SPACE
	| '\u200A' // HAIR SPACE
	| '\u202F' // NARROW NO_BREAK SPACE
	| '\u3000' // IDEOGRAPHIC SPACE
	| '\u205F' // MEDIUM MATHEMATICAL SPACE
	;
fragment EscapeSequence
    :   '\\' ('b'|'t'|'n'|'f'|'r'|'\"'|'\''|'\\')
    |   OctalEscape
    |   UnicodeEscape
    ;
fragment OctalEscape
    :   '\\' ('0'..'3') ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7')
    ;
fragment HexDigit : ('0'..'9'|'a'..'f'|'A'..'F') ;
fragment UnicodeEscape
    :   '\\' 'u' HexDigit HexDigit HexDigit HexDigit
    |   '\\' 'x' HexDigit HexDigit
    ;